@echo off
echo ========================================
echo    Serveur Minecraft - Tunnel ngrok
echo ========================================
echo.
echo Demarrage du tunnel pour votre serveur Minecraft...
echo Votre ami pourra se connecter avec l'adresse affichee ci-dessous
echo.
echo IMPORTANT: Notez l'adresse tcp:// qui s'affiche ci-dessous
echo Exemple: tcp://0.tcp.ngrok.io:12345    // (exemple de adresse ngrok à envoyer à votre amis)
echo.
echo Votre ami devra utiliser:
echo - Adresse: 0.tcp.ngrok.io              // (exemple à remplacer par l'adresse ngrok fourni dans le terminal)
echo - Port: 12345                          // (exemple à remplacer par votre port)
echo.
echo Appuyez sur Ctrl+C pour arreter le tunnel
echo.

REM Configurer le token ngrok depuis le fichier .env
for /f "tokens=2 delims==" %%a in ('findstr "TOKEN_NGROK" .env') do set NGROK_TOKEN=%%a

REM Configurer le token
"%LOCALAPPDATA%\Microsoft\WinGet\Packages\Ngrok.Ngrok_Microsoft.Winget.Source_8wekyb3d8bbwe\ngrok.exe" config add-authtoken %NGROK_TOKEN%

REM Lancer le tunnel
echo Lancement du tunnel ngrok...
"%LOCALAPPDATA%\Microsoft\WinGet\Packages\Ngrok.Ngrok_Microsoft.Winget.Source_8wekyb3d8bbwe\ngrok.exe" tcp 12345            // (exemple à remplacer par votre port)

pause
