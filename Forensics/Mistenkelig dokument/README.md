# Mistenkelig dokument

Det har blitt gjennomført flere beslag hos den notoriske skattesvindleren Kjell T. Ringen. Under den digitale gjennomgangen av utstyret hans har etterforskerne indikasjoner på at gjenopprettingsordene (seed phrase) til en kryptolommebok kan være lagret lokalt på maskinen.<br/><br/>
Blant de beslaglagte filene ble det identifisert et mistenkelig Word-dokument. Dokumentet fremstår ved første øyekast som harmløst, men vi har grunn til å tro at det kan skjule de aktuelle gjenopprettingsordene.<br/><br/>
Din oppgave er å analysere dokumentet og avdekke om det inneholder skjult informasjon. <br/>
> Filen er benign, men kan trigge antivirusalarmer. Det anbefales å løse oppgaven i en lokal VM eller en sandkasse. <br/> Passord til zip-fil: `skattctf`

[⬇️ FeelsTaxMan.zip](./FeelsTaxMan.zip)

# Writeup

Kjører [ViperMonkey](https://github.com/decalage2/ViperMonkey/blob/master/docker/dockermonkey.sh) på filen for å hente ut script:

```
> ./dockermonkey.sh FeelsTaxMan.docm
[*] Running 'docker ps' to see if script has required privileges to run...
[*] Pulling and starting container...
[*] Attempting to copy file FeelsTaxMan.docm into container ID 
[*] Starting openoffice listener for file content conversions...
[*] Checking for ViperMonkey and dependency updates...
[*] Disabling network connection for container ID 634f47df8e611ad1352c995ba6f94e5af5f164c3eff6cc6b17025f643b9e4215
Successfully copied 56.8kB to 634f47df8e611ad1352c995ba6f94e5af5f164c3eff6cc6b17025f643b9e4215:/root/FeelsTaxMan.docm
INFO     Starting emulation...
INFO     Emulating an Office (VBA) file.
INFO     Reading document metadata...
WARNING  Reading in metadata failed. Trying fallback. not an OLE2 structured storage file
WARNING  File is not an Excel 97 file. Not reading with xlrd2.
INFO     Saving dropped analysis artifacts in /root/FeelsTaxMan.docm_artifacts/
INFO     Parsing VB...
INFO     Modifying VB code...
INFO     parsed Sub Silence (): 3 statement(s)
INFO     parsed Sub AutoOpen (): 1 statement(s)
INFO     Reading document variables...
INFO     Reading document comments...
INFO     Reading Shapes object text fields...
INFO     Finding embedded files...
INFO     Reading InlineShapes object text fields...
INFO     Reading TextBox and RichEdit object text fields...
INFO     Reading custom document properties...
INFO     Reading embedded object text fields...
INFO     Reading document text and tables...
INFO     Reading form variables...
INFO     ACTION: Start Regular Emulation - params '' - All wildcard matches will match
INFO     Emulating loose statements...
INFO     ACTION: Found Entry Point - params 'autoopen' -
INFO     evaluating Sub AutoOpen
INFO     Calling Procedure: Silence("''")
INFO     evaluating Sub Silence
INFO     Found possible intermediate IOC (base64): '1f8b080017429c6900ff5d55096fdacc16fd2b5788a7102521b6c7e3a551a467300487104280666bf5696c8f1db399d86609afefbff70c5f2b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0f0adcc167215c9dad5bddc5d04955cd245372f22491793cfb5243f2b6454e5c527d5d31fc34d7571bf592caeeaebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb967af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5ebe80dd4b779e77963838f0d708d207f0b19658fc8f17accf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff0d94de96ff8ebc7663eedf34b7db7393c4b5e0eeef628e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d9367193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733cf00e2b29fa53efc37fea67017f3d0c269de798b9eeebba758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36d7abb476fed6ce575b5954f0ea16f9b2254a6999e3aac85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7c8d4c98dc872d5639290c9c9d594d14c2862c434d22272f8f148906e92199334283649081595c4e41aa44932a5ca69e1949166916e90c348c7d75081ae20db24232633526b2c8819c7a20e250ec9846c4611420086919b90e4246d8a1232120a518553282974c80d49d8a43b242c321c72049978041d9b0c9d749bc290b84d3224e77792d05446f873a1fc013e821d80c10834519d51888d495a4202e01d32c11a191809ae68462ed91a714eb1a63208384037d4e5ca13962454f4854e16988614215c103749d729d2896b2a0f8e6c8b98a5e8c496aa829cd096eb141f57db50d5a10058432ea951080b08ba14c28e5ed80a2df6365a034d001be2846448c5d7b07ead50d53294ec5644a64109a8a12860271443e18818b2814e4442921e13437553f59aa31d11d93a49f89b4722919a0dd4853e2254e0ed90127034d5083153f5050e00c3e0c0547e173ab8244ce2b182819e5a98349bdc986c47154545dd3dba71552ec13c18aa1d36f44120c600f961c19aa8fc36e039148394541dd7a5920b30241a07763671d0c1144134a8719c34acf0c700c44cf505042dec6d359c09c281e498c4c18071e2a1c203cdd102740ddd0142c750c38637c53aca0e9c1812749cfda6a04608dd8402820c4d21318e4430544a2574013d424e503882d4d011fd281d535031c31aca6100b45a73bc5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb09b7c2402e71a5e3259762a98e9bc7fb0191b373ed1c6bf34eaed2eafdf48f1b1f4e0f79995559bebad6aeeae9df29dbf9725dc8b2c479f3e690adff4dde40dcb9ba87fe3cfe633fc863753df932fa6503da6afb57ea7f533d4a11cba281caa757c16a9bcfe54567ff3b0f21aaa93c26796715374eb15f2f44241bb571258aeae2a1c82378d6ce6bbf42d53f5dedf427bfe3af100b0700'
INFO     Calling Procedure: Shell('[\'powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ""$h=\\\'1f8b08001742...')
INFO     Shell('powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ""$h=\'1f8b080017429c6900ff5d55096fdacc16fd2b5788a7102521b6c7e3a551a467300487104280666bf5696c8f1db399d86609afefbff70c5f2b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0f0adcc167215c9dad5bddc5d04955cd245372f22491793cfb5243f2b6454e5c527d5d31fc34d7571bf592caeeaebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb967af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5ebe80dd4b779e77963838f0d708d207f0b19658fc8f17accf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff0d94de96ff8ebc7663eedf34b7db7393c4b5e0eeef628e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d9367193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733cf00e2b29fa53efc37fea67017f3d0c269de798b9eeebba758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36d7abb476fed6ce575b5954f0ea16f9b2254a6999e3aac85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7c8d4c98dc872d5639290c9c9d594d14c2862c434d22272f8f148906e92199334283649081595c4e41aa44932a5ca69e1949166916e90c348c7d75081ae20db24232633526b2c8819c7a20e250ec9846c4611420086919b90e4246d8a1232120a518553282974c80d49d8a43b242c321c72049978041d9b0c9d749bc290b84d3224e77792d05446f873a1fc013e821d80c10834519d51888d495a4202e01d32c11a191809ae68462ed91a714eb1a63208384037d4e5ca13962454f4854e16988614215c103749d729d2896b2a0f8e6c8b98a5e8c496aa829cd096eb141f57db50d5a10058432ea951080b08ba14c28e5ed80a2df6365a034d001be2846448c5d7b07ead50d53294ec5644a64109a8a12860271443e18818b2814e4442921e13437553f59aa31d11d93a49f89b4722919a0dd4853e2254e0ed90127034d5083153f5050e00c3e0c0547e173ab8244ce2b182819e5a98349bdc986c47154545dd3dba71552ec13c18aa1d36f44120c600f961c19aa8fc36e039148394541dd7a5920b30241a07763671d0c1144134a8719c34acf0c700c44cf505042dec6d359c09c281e498c4c18071e2a1c203cdd102740ddd0142c750c38637c53aca0e9c1812749cfda6a04608dd8402820c4d21318e4430544a2574013d424e503882d4d011fd281d535031c31aca6100b45a73bc5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb09b7c2402e71a5e3259762a98e9bc7fb0191b373ed1c6bf34eaed2eafdf48f1b1f4e0f79995559bebad6aeeae9df29dbf9725dc8b2c479f3e690adff4dde40dcb9ba87fe3cfe633fc863753df932fa6503da6afb57ea7f533d4a11cba281caa757c16a9bcfe54567ff3b0f21aaa93c26796715374eb15f2f44241bb571258aeae2a1c82378d6ce6bbf42d53f5dedf427bfe3af100b070000\';$xt = for ($i=0; $i -lt $h.Length; $i+=2){[Convert]::ToByte($h.Substring($i,2),16)};$ll = New-Object IO.MemoryStream;$ll.Write($xt,0,$xt.Length);$ll.Position=0;$ty = New-Object IO.Compression.GzipStream($ll,[IO.Compression.CompressionMode]::Decompress);$op = New-Object IO.StreamReader($ty);$rjq=$op.ReadToEnd();Invoke-Expression $rjq;"')
INFO     ACTION: Execute Command - params 'powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ""$h=\'1f8b080017429c6900ff5d55096fdacc16fd2b5788a7102521b6c7e3a551a467300487104280666bf5696c8f1db399d86609afefbff70c5f2b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0f0adcc167215c9dad5bddc5d04955cd245372f22491793cfb5243f2b6454e5c527d5d31fc34d7571bf592caeeaebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb967af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5ebe80dd4b779e77963838f0d708d207f0b19658fc8f17accf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff0d94de96ff8ebc7663eedf34b7db7393c4b5e0eeef628e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d9367193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733cf00e2b29fa53efc37fea67017f3d0c269de798b9eeebba758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36d7abb476fed6ce575b5954f0ea16f9b2254a6999e3aac85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7c8d4c98dc872d5639290c9c9d594d14c2862c434d22272f8f148906e92199334283649081595c4e41aa44932a5ca69e1949166916e90c348c7d75081ae20db24232633526b2c8819c7a20e250ec9846c4611420086919b90e4246d8a1232120a518553282974c80d49d8a43b242c321c72049978041d9b0c9d749bc290b84d3224e77792d05446f873a1fc013e821d80c10834519d51888d495a4202e01d32c11a191809ae68462ed91a714eb1a63208384037d4e5ca13962454f4854e16988614215c103749d729d2896b2a0f8e6c8b98a5e8c496aa829cd096eb141f57db50d5a10058432ea951080b08ba14c28e5ed80a2df6365a034d001be2846448c5d7b07ead50d53294ec5644a64109a8a12860271443e18818b2814e4442921e13437553f59aa31d11d93a49f89b4722919a0dd4853e2254e0ed90127034d5083153f5050e00c3e0c0547e173ab8244ce2b182819e5a98349bdc986c47154545dd3dba71552ec13c18aa1d36f44120c600f961c19aa8fc36e039148394541dd7a5920b30241a07763671d0c1144134a8719c34acf0c700c44cf505042dec6d359c09c281e498c4c18071e2a1c203cdd102740ddd0142c750c38637c53aca0e9c1812749cfda6a04608dd8402820c4d21318e4430544a2574013d424e503882d4d011fd281d535031c31aca6100b45a73bc5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb09b7c2402e71a5e3259762a98e9bc7fb0191b373ed1c6bf34eaed2eafdf48f1b1f4e0f79995559bebad6aeeae9df29dbf9725dc8b2c479f3e690adff4dde40dcb9ba87fe3cfe633fc863753df932fa6503da6afb57ea7f533d4a11cba281caa757c16a9bcfe54567ff3b0f21aaa93c26796715374eb15f2f44241bb571258aeae2a1c82378d6ce6bbf42d53f5dedf427bfe3af100b070000\';$xt = for ($i=0; $i -lt $h.Length; $i+=2){[Convert]::ToByte($h.Substring($i,2),16)};$ll = New-Object IO.MemoryStream;$ll.Write($xt,0,$xt.Length);$ll.Position=0;$ty = New-Object IO.Compression.GzipStream($ll,[IO.Compression.CompressionMode]::Decompress);$op = New-Object IO.StreamReader($ty);$rjq=$op.ReadToEnd();Invoke-Expression $rjq;"' - Shell function
 _    ___                 __  ___            __
| |  / (_)___  ___  _____/  |/  /___  ____  / /_____  __  __
| | / / / __ \/ _ \/ ___/ /|_/ / __ \/ __ \/ //_/ _ \/ / / /
| |/ / / /_/ /  __/ /  / /  / / /_/ / / / / ,< /  __/ /_/ /
|___/_/ .___/\___/_/  /_/  /_/\____/_/ /_/_/|_|\___/\__, /
     /_/                                           /____/
vmonkey 1.0.2 - https://github.com/decalage2/ViperMonkey
THIS IS WORK IN PROGRESS - Check updates regularly!
Please report any issue at https://github.com/decalage2/ViperMonkey/issues

===============================================================================
FILE: /root/FeelsTaxMan.docm
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls
in file: word/vbaProject.bin - OLE stream: u'VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas
in file: word/vbaProject.bin - OLE stream: u'VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-------------------------------------------------------------------------------
VBA CODE (with long lines collapsed):

Sub Silence()
Dim seed As String
seed = "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command """"$h='" & "1f8b080017429c6900ff5d55096fdacc16fd2b5788a7102521b6c7e3a551a467300487104280666bf5696c8f1db399d86609afefbff70c5f2b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0f0adcc167215c9dad5bddc5d04955cd245372f22491793cfb5243f2b6454e5c527d5d31fc34d7571bf592caeeaebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb967af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5ebe80dd4b779e77963838f0d708d207f0b19658fc8f17accf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff0d94de96ff8ebc7663" & "eedf34b7db7393c4b5e0eeef628e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d9367193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733cf00e2b29fa53efc37fea67017f3d0c269de798b9eeebba758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36d7abb476fed6ce" & "575b5954f0ea16f9b2254a6999e3aac85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7c8d4c98dc872d5639290c9c9d594d14c2862c434d22272f8f148906e92199334283649081595c4e41aa44932a5ca69e1949166916e90c348c7d75081ae20db24232633526b2c8819c7a20e250ec9846c4611420086919b90e4246d8a1232120a518553282974c80d49d8a43b242c321c72049978041d9b0c9d749bc290b84d3224e77792d05446f873a1fc013e821d80c10834519d51888d495a4202e01d32c11a191809ae68462ed91a714eb1a63208384037d4e5ca13962454f4854e16988614215c103749d729d2896b2a0f8e6c8" & "b98a5e8c496aa829cd096eb141f57db50d5a10058432ea951080b08ba14c28e5ed80a2df6365a034d001be2846448c5d7b07ead50d53294ec5644a64109a8a12860271443e18818b2814e4442921e13437553f59aa31d11d93a49f89b4722919a0dd4853e2254e0ed90127034d5083153f5050e00c3e0c0547e173ab8244ce2b182819e5a98349bdc986c47154545dd3dba71552ec13c18aa1d36f44120c600f961c19aa8fc36e039148394541dd7a5920b30241a07763671d0c1144134a8719c34acf0c700c44cf505042dec6d359c09c281e498c4c18071e2a1c203cdd102740ddd0142c750c38637c53aca0e9c1812749cfda6a0" & "4608dd8402820c4d21318e4430544a2574013d424e503882d4d011fd281d535031c31aca6100b45a73bc5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb09b7c2402e71a5e3259762a98e9bc7fb0191b373ed1c6bf34eaed2eafdf48f1b1f4e0f79995559bebad6aeeae9df29dbf9725dc8b2c479f3e690adff4dde40dcb9ba87fe3cfe633fc863753df932fa6503da6afb57ea7f533d4a11cba281caa757c16a9bcfe54567ff3b0f21aaa93c26796715374eb15f2f44241bb571258aeae2a1c82378d6ce6bbf42d53f5dedf427bfe3af100b070000';" &     "$xt = for ($i=0; $i -lt $h.Length; $i+=2){[Convert]::ToByte($h.Substring($i,2),16)};" &     "$ll = New-Object IO.MemoryStream;$ll.Write($xt,0,$xt.Length);$ll.Position=0;" &     "$ty = New-Object IO.Compression.GzipStream($ll,[IO.Compression.CompressionMode]::Decompress);" &     "$op = New-Object IO.StreamReader($ty);$rjq=$op.ReadToEnd();Invoke-Expression $rjq;"""
Shell seed, vbHide
End Sub
Sub AutoOpen()
Call Silence
End Sub




-------------------------------------------------------------------------------
PARSING VBA CODE:

-------------------------------------------------------------------------------
TRACING VBA CODE (entrypoint = Auto*):

Recorded Actions:
+----------------------+-----------------------------------------------+---------------------------------+
| Action               | Parameters                                    | Description                     |
+----------------------+-----------------------------------------------+---------------------------------+
| Start Regular        |                                               | All wildcard matches will match |
| Emulation            |                                               |                                 |
| Found Entry Point    | autoopen                                      |                                 |
| Execute Command      | powershell.exe -NoProfile -ExecutionPolicy    | Shell function                  |
|                      | Bypass -Command ""$h='1f8b080017429c6900ff5d5 |                                 |
|                      | 5096fdacc16fd2b5788a7102521b6c7e3a551a4673004 |                                 |
|                      | 87104280666bf5696c8f1db399d86609afefbff70c5f2 |                                 |
|                      | b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0 |                                 |
|                      | f0adcc167215c9dad5bddc5d04955cd245372f2249179 |                                 |
|                      | 3cfb5243f2b6454e5c527d5d31fc34d7571bf592caeea |                                 |
|                      | ebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb9 |                                 |
|                      | 67af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5e |                                 |
|                      | be80dd4b779e77963838f0d708d207f0b19658fc8f17a |                                 |
|                      | ccf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1 |                                 |
|                      | ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff |                                 |
|                      | 0d94de96ff8ebc7663eedf34b7db7393c4b5e0eeef628 |                                 |
|                      | e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d93 |                                 |
|                      | 67193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733c |                                 |
|                      | f00e2b29fa53efc37fea67017f3d0c269de798b9eeebb |                                 |
|                      | a758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593 |                                 |
|                      | f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93 |                                 |
|                      | a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d |                                 |
|                      | 42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d |                                 |
|                      | 62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2 |                                 |
|                      | b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d |                                 |
|                      | 1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36 |                                 |
|                      | d7abb476fed6ce575b5954f0ea16f9b2254a6999e3aac |                                 |
|                      | 85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7 |                                 |
|                      | c8d4c98dc872d5639290c9c9d594d14c2862c434d2227 |                                 |
|                      | 2f8f148906e92199334283649081595c4e41aa44932a5 |                                 |
|                      | ca69e1949166916e90c348c7d75081ae20db242326335 |                                 |
|                      | 26b2c8819c7a20e250ec9846c4611420086919b90e424 |                                 |
|                      | 6d8a1232120a518553282974c80d49d8a43b242c321c7 |                                 |
|                      | 2049978041d9b0c9d749bc290b84d3224e77792d05446 |                                 |
|                      | f873a1fc013e821d80c10834519d51888d495a4202e01 |                                 |
|                      | d32c11a191809ae68462ed91a714eb1a63208384037d4 |                                 |
|                      | e5ca13962454f4854e16988614215c103749d729d2896 |                                 |
|                      | b2a0f8e6c8b98a5e8c496aa829cd096eb141f57db50d5 |                                 |
|                      | a10058432ea951080b08ba14c28e5ed80a2df6365a034 |                                 |
|                      | d001be2846448c5d7b07ead50d53294ec5644a64109a8 |                                 |
|                      | a12860271443e18818b2814e4442921e13437553f59aa |                                 |
|                      | 31d11d93a49f89b4722919a0dd4853e2254e0ed901270 |                                 |
|                      | 34d5083153f5050e00c3e0c0547e173ab8244ce2b1828 |                                 |
|                      | 19e5a98349bdc986c47154545dd3dba71552ec13c18aa |                                 |
|                      | 1d36f44120c600f961c19aa8fc36e039148394541dd7a |                                 |
|                      | 5920b30241a07763671d0c1144134a8719c34acf0c700 |                                 |
|                      | c44cf505042dec6d359c09c281e498c4c18071e2a1c20 |                                 |
|                      | 3cdd102740ddd0142c750c38637c53aca0e9c1812749c |                                 |
|                      | fda6a04608dd8402820c4d21318e4430544a2574013d4 |                                 |
|                      | 24e503882d4d011fd281d535031c31aca6100b45a73bc |                                 |
|                      | 5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7 |                                 |
|                      | ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb |                                 |
|                      | ();Invoke-Expression $rjq;"                   |                                 |
+----------------------+-----------------------------------------------+---------------------------------+INFO     Found 1 possible IOCs. Stripping duplicates...
INFO     Making dropped sample directory ...


Intermediate IOCs:

+---------------------------------------------------------+
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ""$h='1f8b080017429c6900ff5d55096fdacc16fd2b5788a7102521b6c7e3a551a467300487104280666bf5696c8f1db399d86609afefbff70c5f2b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0f0adcc167215c9dad5bddc5d04955cd245372f22491793cfb5243f2b6454e5c527d5d31fc34d7571bf592caeeaebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb967af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5ebe80dd4b779e77963838f0d708d207f0b19658fc8f17accf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff0d94de96ff8ebc7663eedf34b7db7393c4b5e0eeef628e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d9367193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733cf00e2b29fa53efc37fea67017f3d0c269de798b9eeebba758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36d7abb476fed6ce575b5954f0ea16f9b2254a6999e3aac85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7c8d4c98dc872d5639290c9c9d594d14c2862c434d22272f8f148906e92199334283649081595c4e41aa44932a5ca69e1949166916e90c348c7d75081ae20db24232633526b2c8819c7a20e250ec9846c4611420086919b90e4246d8a1232120a518553282974c80d49d8a43b242c321c72049978041d9b0c9d749bc290b84d3224e77792d05446f873a1fc013e821d80c10834519d51888d495a4202e01d32c11a191809ae68462ed91a714eb1a63208384037d4e5ca13962454f4854e16988614215c103749d729d2896b2a0f8e6c8b98a5e8c496aa829cd096eb141f57db50d5a10058432ea951080b08ba14c28e5ed80a2df6365a034d001be2846448c5d7b07ead50d53294ec5644a64109a8a12860271443e18818b2814e4442921e13437553f59aa31d11d93a49f89b4722919a0dd4853e2254e0ed90127034d5083153f5050e00c3e0c0547e173ab8244ce2b182819e5a98349bdc986c47154545dd3dba71552ec13c18aa1d36f44120c600f961c19aa8fc36e039148394541dd7a5920b30241a07763671d0c1144134a8719c34acf0c700c44cf505042dec6d359c09c281e498c4c18071e2a1c203cdd102740ddd0142c750c38637c53aca0e9c1812749cfda6a04608dd8402820c4d21318e4430544a2574013d424e503882d4d011fd281d535031c31aca6100b45a73bc5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb09b7c2402e71a5e3259762a98e9bc7fb0191b373ed1c6bf34eaed2eafdf48f1b1f4e0f79995559bebad6aeeae9df29dbf9725dc8b2c479f3e690adff4dde40dcb9ba87fe3cfe633fc863753df932fa6503da6afb57ea7f533d4a11cba281caa757c16a9bcfe54567ff3b0f21aaa93c26796715374eb15f2f44241bb571258aeae2a1c82378d6ce6bbf42d53f5dedf427bfe3af100b070000';$xt = for ($i=0; $i -lt $h.Length; $i+=2){[Convert]::ToByte($h.Substring($i,2),16)};$ll = New-Object IO.MemoryStream;$ll.Write($xt,0,$xt.Length);$ll.Position=0;$ty = New-Object IO.Compression.GzipStream($ll,[IO.Compression.CompressionMode]::Decompress);$op = New-Object IO.StreamReader($ty);$rjq=$op.ReadToEnd();Invoke-Expression $rjq;"
+---------------------------------------------------------+

VBA Builtins Called: ['Shell']

Finished analyzing /root/FeelsTaxMan.docm .

  adding: root/FeelsTaxMan.docm_artifacts/ (stored 0%)
Successfully copied 2.05kB to ./feelstaxman/test.zip
[*] Dropped files are in FeelsTaxMan.docm_artifacts.zip
[*] Done - Killing docker container 634f47df8e611ad1352c995ba6f94e5af5f164c3eff6cc6b17025f643b9e4215

Intermediate IOCs:

+---------------------------------------------------------+
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ""$h='1f8b080017429c6900ff5d55096fdacc16fd2b5788a7102521b6c7e3a551a467300487104280666bf5696c8f1db399d86609afefbff70c5f2b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0f0adcc167215c9dad5bddc5d04955cd245372f22491793cfb5243f2b6454e5c527d5d31fc34d7571bf592caeeaebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb967af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5ebe80dd4b779e77963838f0d708d207f0b19658fc8f17accf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff0d94de96ff8ebc7663eedf34b7db7393c4b5e0eeef628e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d9367193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733cf00e2b29fa53efc37fea67017f3d0c269de798b9eeebba758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36d7abb476fed6ce575b5954f0ea16f9b2254a6999e3aac85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7c8d4c98dc872d5639290c9c9d594d14c2862c434d22272f8f148906e92199334283649081595c4e41aa44932a5ca69e1949166916e90c348c7d75081ae20db24232633526b2c8819c7a20e250ec9846c4611420086919b90e4246d8a1232120a518553282974c80d49d8a43b242c321c72049978041d9b0c9d749bc290b84d3224e77792d05446f873a1fc013e821d80c10834519d51888d495a4202e01d32c11a191809ae68462ed91a714eb1a63208384037d4e5ca13962454f4854e16988614215c103749d729d2896b2a0f8e6c8b98a5e8c496aa829cd096eb141f57db50d5a10058432ea951080b08ba14c28e5ed80a2df6365a034d001be2846448c5d7b07ead50d53294ec5644a64109a8a12860271443e18818b2814e4442921e13437553f59aa31d11d93a49f89b4722919a0dd4853e2254e0ed90127034d5083153f5050e00c3e0c0547e173ab8244ce2b182819e5a98349bdc986c47154545dd3dba71552ec13c18aa1d36f44120c600f961c19aa8fc36e039148394541dd7a5920b30241a07763671d0c1144134a8719c34acf0c700c44cf505042dec6d359c09c281e498c4c18071e2a1c203cdd102740ddd0142c750c38637c53aca0e9c1812749cfda6a04608dd8402820c4d21318e4430544a2574013d424e503882d4d011fd281d535031c31aca6100b45a73bc5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb09b7c2402e71a5e3259762a98e9bc7fb0191b373ed1c6bf34eaed2eafdf48f1b1f4e0f79995559bebad6aeeae9df29dbf9725dc8b2c479f3e690adff4dde40dcb9ba87fe3cfe633fc863753df932fa6503da6afb57ea7f533d4a11cba281caa757c16a9bcfe54567ff3b0f21aaa93c26796715374eb15f2f44241bb571258aeae2a1c82378d6ce6bbf42d53f5dedf427bfe3af100b070000';$xt = for ($i=0; $i -lt $h.Length; $i+=2){[Convert]::ToByte($h.Substring($i,2),16)};$ll = New-Object IO.MemoryStream;$ll.Write($xt,0,$xt.Length);$ll.Position=0;$ty = New-Object IO.Compression.GzipStream($ll,[IO.Compression.CompressionMode]::Decompress);$op = New-Object IO.StreamReader($ty);$rjq=$op.ReadToEnd();Invoke-Expression $rjq;"
+---------------------------------------------------------+

VBA Builtins Called: ['Shell']

Finished analyzing /root/FeelsTaxMan.docm .

  adding: root/FeelsTaxMan.docm_artifacts/ (stored 0%)
Successfully copied 2.05kB to ./feelstaxman/test.zip
[*] Dropped files are in FeelsTaxMan.docm_artifacts.zip
[*] Done - Killing docker container 634f47df8e611ad1352c995ba6f94e5af5f164c3eff6cc6b17025f643b9e4215
INFO     Making dropped sample directory ...


Intermediate IOCs:

+---------------------------------------------------------+
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ""$h='1f8b080017429c6900ff5d55096fdacc16fd2b5788a7102521b6c7e3a551a467300487104280666bf5696c8f1db399d86609afefbff70c5f2b55456818dfb9cb39e75e0ff5f4ba5697abed974967f0f0adcc167215c9dad5bddc5d04955cd245372f22491793cfb5243f2b6454e5c527d5d31fc34d7571bf592caeeaebeb5af6b5357cdc69fd9b34f7f0b91f4fdf3bd314bb967af4466d2fc04f7b347f4a0d65086eee83e95cf3bc5ebe80dd4b779e77963838f0d708d207f0b19658fc8f17accf21bf4df653b5f527e3e963eb6b6f2658b7bf8fa2d1ce0f0687d9ddae578d466e6a7ff6ef2fbd6dd0763ddff0d94de96ff8ebc7663eedf34b7db7393c4b5e0eeef628e494d9f0363ecbfdd07d4dbac16176d64b1d6f78b0d9367193f8b2d8942f2f2fe6e1ae4cdb66916d6f8cde733cf00e2b29fa53efc37fea67017f3d0c269de798b9eeebba758be77da7f5f9b4148f9dc7ceb8fff1b17cedccc593f8387b1f694e27e09c89c9749e4faa07ce5afab4fbf93a1e67c168c41e8c5e6abe3bfee8c55bb616fdfe0b139d42a6db33737760f7fdb628c46e79085ba51f2f2f9f27d62c1b76bcbbdba76519e449d9db5e8eb83790dafeebe2b1b77bf78faa7716ddc97cbc192ddbeddad55b306c76d1deef5fbe3c155925bdc5a2f559c9b251aba7df445c36d7abb476fed6ce575b5954f0ea16f9b2254a6999e3aac85669a3be3e3dbdaabfcbfd754d4fc809497348d348b7c8d4c98dc872d5639290c9c9d594d14c2862c434d22272f8f148906e92199334283649081595c4e41aa44932a5ca69e1949166916e90c348c7d75081ae20db24232633526b2c8819c7a20e250ec9846c4611420086919b90e4246d8a1232120a518553282974c80d49d8a43b242c321c72049978041d9b0c9d749bc290b84d3224e77792d05446f873a1fc013e821d80c10834519d51888d495a4202e01d32c11a191809ae68462ed91a714eb1a63208384037d4e5ca13962454f4854e16988614215c103749d729d2896b2a0f8e6c8b98a5e8c496aa829cd096eb141f57db50d5a10058432ea951080b08ba14c28e5ed80a2df6365a034d001be2846448c5d7b07ead50d53294ec5644a64109a8a12860271443e18818b2814e4442921e13437553f59aa31d11d93a49f89b4722919a0dd4853e2254e0ed90127034d5083153f5050e00c3e0c0547e173ab8244ce2b182819e5a98349bdc986c47154545dd3dba71552ec13c18aa1d36f44120c600f961c19aa8fc36e039148394541dd7a5920b30241a07763671d0c1144134a8719c34acf0c700c44cf505042dec6d359c09c281e498c4c18071e2a1c203cdd102740ddd0142c750c38637c53aca0e9c1812749cfda6a04608dd8402820c4d21318e4430544a2574013d424e503882d4d011fd281d535031c31aca6100b45a73bc5e6455e3844ed41b3abb7e0bf16abf7dfffedf867a5f7ffce77f27dafee4acfecfff713c4faed5ed3e0c67b8cb09b7c2402e71a5e3259762a98e9bc7fb0191b373ed1c6bf34eaed2eafdf48f1b1f4e0f79995559bebad6aeeae9df29dbf9725dc8b2c479f3e690adff4dde40dcb9ba87fe3cfe633fc863753df932fa6503da6afb57ea7f533d4a11cba281caa757c16a9bcfe54567ff3b0f21aaa93c26796715374eb15f2f44241bb571258aeae2a1c82378d6ce6bbf42d53f5dedf427bfe3af100b070000';$xt = for ($i=0; $i -lt $h.Length; $i+=2){[Convert]::ToByte($h.Substring($i,2),16)};$ll = New-Object IO.MemoryStream;$ll.Write($xt,0,$xt.Length);$ll.Position=0;$ty = New-Object IO.Compression.GzipStream($ll,[IO.Compression.CompressionMode]::Decompress);$op = New-Object IO.StreamReader($ty);$rjq=$op.ReadToEnd();Invoke-Expression $rjq;"
+---------------------------------------------------------+

VBA Builtins Called: ['Shell']

Finished analyzing /root/FeelsTaxMan.docm .

  adding: root/FeelsTaxMan.docm_artifacts/ (stored 0%)
Successfully copied 2.05kB to ./feelstaxman/test.zip
[*] Dropped files are in FeelsTaxMan.docm_artifacts.zip
[*] Done - Killing docker container 634f47df8e611ad1352c995ba6f94e5af5f164c3eff6cc6b17025f643b9e4215
```

ViperMonkey gjorde grovjobben og hentet ut:

```
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ""$h='<stor hex>';
$xt = for ($i=0;
 $i -lt $h.Length;
 $i+=2){[Convert]::ToByte($h.Substring($i,2),16)};
$ll = New-Object IO.MemoryStream;
$ll.Write($xt,0,$xt.Length);
$ll.Position=0;
$ty = New-Object IO.Compression.GzipStream($ll,[IO.Compression.CompressionMode]::Decompress);
$op = New-Object IO.StreamReader($ty);
$rjq=$op.ReadToEnd();
Invoke-Expression $rjq;
```

Koden ser ut til å dekode hex, putte det i en memorystream og kjøre gzip-decompress.

Det resulterer i følgende:

```
$g="$env:TEMP\silence";
New-Item -Force -Type Directory $g|Out-Null;
$p="iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAADTSURBVHja3FKxccQwDIMzjLwHtQQ9g7yKN/AvIC9AD2D3GsDu5ZqukUK5/1wuzXe5sMLxAAI8siOJd+oDb9ZfFIzj+Hg8AOz73vf9fd/rusYYY4zLsgC4rivG2HXdMAzneaKUAqDWKiI5ZzMTEXd399ZpBJI5ZxEByWmaRERESKqqmZEkaWaq+hQ08EI553aTUkoTtP53B1UFyZSSiIQQ3P2Hg4h8DQYAmBlKKY3aEregv+4wz3NKCarawmzbBsDdm/XT6jiOEALJWmsIofsHv/Q5AMe0xVlRHwhDAAAAAElFTkSuQmCC";
[IO.File]::WriteAllBytes("$g\ads.png",[Convert]::FromBase64String($p));
$hex="1f 8b 08 00 16 41 9c 69 00 ff 45 90 41 4f c3 30 0c 85 ff 4a 14 4d e2 d4 aa 69 fd 92 0e 4e 08 6d e3 06 12 83 13 12 4a 9a 74 2d 4c 2d da 32 69 08 f8 ef 73 c2 81 93 9f e5 e7 cf 2f b9 f5 be b8 9b a7 18 a6 28 8a 47 1b 07 21 17 bb 57 eb 8f e5 e7 b4 bb a6 5a 8a e2 c5 ee 4f 41 48 e3 b1 44 0f a3 08 40 0b 83 a5 aa c9 70 55 d0 8a a8 46 47 15 40 8a fb 4e a1 6a 9b c0 0a 54 11 c1 50 a5 6a 76 36 b9 d6 08 70 0c 51 dc 51 72 a3 81 cf 9a e0 b2 aa 49 b3 83 37 48 b3 7f c9 f3 bf bb 2e eb 26 eb 26 69 62 12 6c 42 f1 46 ba af d2 8c 33 80 5c ae 1d 3c 54 c3 59 0c 71 e6 b4 9b cc 9c 37 b1 ab 36 7b fa 94 8b 34 f5 9c c9 31 a3 d2 9e a9 a4 5d 62 c2 68 07 9d 78 5c 1d 19 9e a5 0c fc 22 ee 7a 79 a3 ca 92 ea 9f f5 7c 58 d9 6e 28 1e dc 7b e8 e2 f7 53 88 ff 9f ba 9a ba d9 8f d3 4e 3c 6f d7 6d fe dd 7e dc 87 c5 5b 19 cf 51 0a b9 1d 82 b8 1f 63 37 0c e3 47 38 5c 1d c5 e6 34 fa 20 e2 2c 22 4f 36 76 6f cf 5f f2 f7 02 11 fa 93 ff a7 01 00 00".Split(' ');
$hj=[byte[]]@($hex|%{'0x'+$_});
$kf=New-Object IO.MemoryStream;
$kf.Write($hj,0,$hj.Length)|Out-Null;
$kf.Position=0;
$gf=New-Object IO.Compression.GzipStream($kf,[IO.Compression.CompressionMode]::Decompress);
$tv=New-Object IO.StreamReader($gf);
Invoke-Expression $tv.ReadToEnd().Replace("Start-Process","Invoke-Item")
```

`$p` er base64 og skrives til `ads.png`. Rendrer den:
![XOR-i-bilde](xor.png)

Ser ut som et hint om at XOR skal brukes.

`$hex` kan vi dekode og kjøre gunzip på for å få:
```
Add-Content -Path "$g\ads.png:42" -Value "7d595f571455585759124757515614425c405541515c15083e5155404457401257534012525e5b45514014515c535d4014545b5d4012465b4257461259535f57145b59535357145359534e5b5a5514465c4051571441554b14415c5d51383e745853535551461457460814415f5340464f455b40506d5b546b465c576b56554b6b5b476d595357405b4f";
1..42|ForEach-Object{Set-Content -Encoding UTF8 "$g\file$_.txt" "The Hitchhiker's Guide to the Galaxy"}
```

Denne ønsker å skrive hex-strengen til `ads.png:42`, som er Windows sin måte å angi en [alternate datastreams](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/c54dec26-1551-4d3a-a0ea-4fa40f848eb3) i NTFS på. Dette hintes det til i filnavnet også. Sammen med hintet om XOR i `ads.png` forsøker vi å gjøre XOR med "42" (nummeret på datastreamen), og får følgende klartekst:

```
Ikke glem seed phrasen!:
carpet cat flower chair foot river make image amazing three say shoe

Flagget er: skatt{word_of_the_day_is_macro}
```




# Flag

```
skatt{word_of_the_day_is_macro}
```
