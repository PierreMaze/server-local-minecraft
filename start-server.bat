@echo off
echo ========================================
echo   Serveur Minecraft - Prominence II
echo ========================================
echo.

REM Vérifier si Docker est installé
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERREUR: Docker n'est pas installé ou n'est pas dans le PATH
    echo Veuillez installer Docker Desktop depuis: https://www.docker.com/products/docker-desktop/
    pause
    exit /b 1
)

REM Vérifier si Docker Compose est disponible
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERREUR: Docker Compose n'est pas disponible
    echo Veuillez installer Docker Desktop avec Docker Compose
    pause
    exit /b 1
)

echo Docker détecté avec succès!
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
)
echo.

REM Construire l'image si nécessaire
echo Construction de l'image Docker...
docker-compose build

if %errorlevel% neq 0 (
    echo ERREUR: Échec de la construction de l'image Docker
    pause
    exit /b 1
)

echo.
echo Démarrage du serveur Minecraft...
echo Le serveur sera accessible sur localhost:%SERVER_PORT%
echo.
echo Pour voir les logs en temps réel, ouvrez un autre terminal et exécutez:
echo docker-compose logs -f
echo.
echo Pour arrêter le serveur, appuyez sur Ctrl+C
echo.

REM Démarrer le serveur
docker-compose up

echo.
echo Serveur arrêté.
pause
