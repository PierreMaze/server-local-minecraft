@echo off
echo ========================================
echo    Serveur Minecraft - Tunnel ngrok
echo ========================================
echo.

REM Charger les variables d'environnement depuis .env
if exist ".env" (
    echo Chargement de la configuration depuis .env...
    for /f "usebackq tokens=1,2 delims==" %%a in (".env") do (
        if not "%%a"=="" if not "%%a:~0,1%"=="#" (
            set "%%a=%%b"
        )
    )
    echo ✅ Configuration chargée
) else (
    echo ⚠️  Fichier .env non trouvé, utilisation des valeurs par défaut
    set SERVER_PORT=12345
    set TOKEN_NGROK=YOUR_TOKEN_NGROK
)
echo.

echo Demarrage du tunnel pour votre serveur Minecraft...
echo Votre ami pourra se connecter avec l'adresse affichee ci-dessous
echo.
echo IMPORTANT: Notez l'adresse tcp:// qui s'affiche ci-dessous
echo Exemple: tcp://0.tcp.ngrok.io:%SERVER_PORT%
echo.
echo Votre ami devra utiliser:
echo - Adresse: 0.tcp.ngrok.io              (remplacer par l'adresse ngrok affichée)
echo - Port: %SERVER_PORT%                  (port configuré dans .env)
echo.
echo Appuyez sur Ctrl+C pour arreter le tunnel
echo.

REM Vérifier si le token ngrok est configuré
if "%TOKEN_NGROK%"=="YOUR_TOKEN_NGROK" (
    echo ❌ ERREUR: Token ngrok non configuré dans le fichier .env
    echo    Veuillez ajouter votre token ngrok dans le fichier .env:
    echo    TOKEN_NGROK=votre_token_ici
    echo.
    pause
    exit /b 1
)

REM Configurer le token
echo Configuration du token ngrok...
"%LOCALAPPDATA%\Microsoft\WinGet\Packages\Ngrok.Ngrok_Microsoft.Winget.Source_8wekyb3d8bbwe\ngrok.exe" config add-authtoken %TOKEN_NGROK%

REM Lancer le tunnel
echo Lancement du tunnel ngrok sur le port %SERVER_PORT%...
"%LOCALAPPDATA%\Microsoft\WinGet\Packages\Ngrok.Ngrok_Microsoft.Winget.Source_8wekyb3d8bbwe\ngrok.exe" tcp %SERVER_PORT%

pause
