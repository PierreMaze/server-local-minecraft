@echo off
echo ========================================
echo   Test de Configuration - Serveur Minecraft
echo ========================================
echo.

echo Vérification des prérequis...
echo.

REM Vérifier Docker
echo [1/4] Vérification de Docker...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker n'est pas installé
    echo    Installez Docker Desktop depuis: https://www.docker.com/products/docker-desktop/
    goto :error
) else (
    echo ✅ Docker est installé
)

REM Vérifier Docker Compose
echo [2/4] Vérification de Docker Compose...
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Compose n'est pas disponible
    goto :error
) else (
    echo ✅ Docker Compose est disponible
)

REM Vérifier les fichiers nécessaires
echo [3/4] Vérification des fichiers de configuration...
if not exist "docker-compose.yml" (
    echo ❌ docker-compose.yml manquant
    goto :error
) else (
    echo ✅ docker-compose.yml présent
)

if not exist "Dockerfile" (
    echo ❌ Dockerfile manquant
    goto :error
) else (
    echo ✅ Dockerfile présent
)

if not exist "Prominence_II_Hasturian_Era_v3.9.1_Server_Pack" (
    echo ❌ Dossier du modpack manquant
    echo    Assurez-vous que le modpack Prominence II est téléchargé
    goto :error
) else (
    echo ✅ Modpack Prominence II présent
)

REM Vérifier l'espace disque
echo [4/4] Vérification de l'espace disque...
for /f "tokens=3" %%a in ('dir /-c ^| find "bytes free"') do set free=%%a
if %free% LSS 10000000000 (
    echo ⚠️  Espace disque faible (moins de 10GB)
    echo    Le serveur nécessite au moins 10GB d'espace libre
) else (
    echo ✅ Espace disque suffisant
)

echo.
echo ========================================
echo   Configuration OK - Prêt à démarrer!
echo ========================================
echo.
echo Pour démarrer le serveur, exécutez:
echo   start-server.bat
echo.
echo Ou manuellement:
echo   docker-compose up -d
echo.
goto :end

:error
echo.
echo ========================================
echo   Configuration incomplète
echo ========================================
echo.
echo Veuillez corriger les erreurs ci-dessus avant de continuer.
echo.
pause
exit /b 1

:end
pause
