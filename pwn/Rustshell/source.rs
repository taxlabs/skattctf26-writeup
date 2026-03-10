use std::io::{self, Write, BufRead};
use std::process::Command;
use std::path::{Path, PathBuf};
use std::collections::HashSet;

const BANNER: &str = r#"
╦═╗╦ ╦╔═╗╔╦╗  ╔═╗╦ ╦╔═╗╦  ╦
╠╦╝║ ║╚═╗ ║   ╚═╗╠═╣║╣ ║  ║
╩╚═╚═╝╚═╝ ╩   ╚═╝╩ ╩╚═╝╩═╝╩═╝
  Secure Shell Environment v1.3.3.7
  Type 'help' for available commands.

  Guest user with limited permissions.
"#;

const JAIL_ROOT: &str = "./jail";

fn jail_root() -> PathBuf {
    Path::new(JAIL_ROOT)
        .canonicalize()
        .unwrap_or_else(|_| PathBuf::from(JAIL_ROOT))
}

fn display_path(real: &Path) -> String {
    let jail = jail_root();
    let rel = real.strip_prefix(&jail).unwrap_or(real);
    let s = rel.to_str().unwrap_or("");
    if s.is_empty() { "/".to_string() } else { format!("/{}", s) }
}

fn resolve_jailed(current_dir: &Path, user_path: &str) -> PathBuf {
    let jail = jail_root();
    let candidate = if Path::new(user_path).is_absolute() {
        jail.join(user_path.trim_start_matches('/'))
    } else {
        current_dir.join(user_path)
    };
    let resolved = candidate.canonicalize().unwrap_or_else(|_| {
        let mut acc = PathBuf::new();
        for comp in candidate.components() {
            match comp {
                std::path::Component::ParentDir => { acc.pop(); }
                std::path::Component::CurDir => {}
                c => acc.push(c),
            }
        }
        acc
    });
    if resolved.starts_with(&jail) { resolved } else { jail }
}

fn execute(cmd: &str, args: &[&str]) {
    let shell_cmd = format!("{} {}", cmd, args.join(" "));
    match Command::new("sh").arg("-c").arg(&shell_cmd).status() {
        Ok(_) => {
            println!("");
        }
        Err(e) => {
            eprintln!("{}: error: {}", cmd, e);
        }
    }
}

fn escape_shell(arg: &str) -> String {
    format!("'{}'", arg.replace('\'', "'\\''"))
}

fn cmd_cd(current_dir: &Path, args: &[&str]) -> PathBuf {
    let target = match args.first().copied() {
        None | Some("~") | Some("/") => jail_root(),
        Some(p) => resolve_jailed(current_dir, p),
    };
    if !target.is_dir() {
        eprintln!("cd: {}: No such file or directory", args.first().unwrap_or(&"/"));
        return current_dir.to_path_buf();
    }
    target
}

fn cmd_help() {
    println!(r#"
Available commands:
  ls    [path]   - list directory contents
  cd    [path]   - change directory
  echo  [text]   - display text
  cat   [file]   - display file contents
  pwd            - print working directory
  uname [-a/-r]  - system information
  whoami         - current user
  clear          - clear screen
  help           - this help message
  exit           - exit shell
"#);
}



fn main() {
    std::fs::create_dir_all(JAIL_ROOT).ok();
    println!("{}", BANNER);
    io::stdout().flush().unwrap();

    let stdin = io::stdin();
    let mut current_dir = jail_root();

    loop {
        let fake_path = display_path(&current_dir);
        print!(
            "\x1b[32mguest\x1b[0m@\x1b[34mrustshell\x1b[0m:\x1b[33m{}\x1b[0m$ ",
            fake_path
        );
        io::stdout().flush().unwrap();

        let mut raw = String::new();
        match stdin.lock().read_line(&mut raw) {
            Ok(0) => { println!(); break; }
            Ok(_) => {}
            Err(_) => break,
        }

        let trimmed = raw.trim();
        if trimmed.is_empty() { continue; }

        let parts: Vec<&str> = trimmed.split_whitespace().collect();
        let cmd  = parts[0];
        let args = &parts[1..];

        match cmd {
            "ls" => {
                let allowed: HashSet<char> = "lahrt1".chars().collect();
                let safe_flags: Vec<&str> = args.iter().copied()
                    .filter(|a| a.starts_with('-'))
                    .map(|s| if s.chars().skip(1).all(|ch| allowed.contains(&ch)) { s } else { "" })
                    .collect();
                let path_arg = args.iter().copied().find(|a| !a.starts_with('-')).unwrap_or(".");
                let safe_path = resolve_jailed(&current_dir, path_arg);
                let safe_path_str = safe_path.to_str().unwrap_or(".");
                let esacaped_path = escape_shell(safe_path_str);
                let mut ls_args = vec!["--color=auto"];
                ls_args.extend(safe_flags.iter().copied().filter(|s| !s.is_empty()));
                ls_args.push(&esacaped_path);
                execute("ls", &ls_args);
            }
            "cat" => {
                let target = args.first().copied().unwrap_or("");
                if target.is_empty() { eprintln!("cat: missing operand"); continue; }
                let safe_path = resolve_jailed(&current_dir, target);
                let escaped_path = escape_shell(safe_path.to_str().unwrap_or("."));
                execute("cat", &[&escaped_path]);
            }
            "uname" => {
                let allowed: HashSet<char> = "arsnm".chars().collect();
                let flag = match args.first() {
                    Some(s) if s.starts_with('-') =>
                        if s.chars().skip(1).all(|ch| allowed.contains(&ch)) { s } else { "-s" },
                    _ => "-s",
                };
                execute("uname", &[flag]);
            }
            "echo"   => execute("echo", args),
            "pwd"    => println!("{}", fake_path),
            "whoami" => println!("guest"),
            "clear"  => { print!("\x1B[2J\x1B[H"); io::stdout().flush().unwrap(); }
            "help"   => cmd_help(),
            "cd"     => current_dir = cmd_cd(&current_dir, args),
            "exit" | "quit" => { println!("Goodbye."); break; }
            other    => eprintln!("{}: command not found", other),
        }
    }
}