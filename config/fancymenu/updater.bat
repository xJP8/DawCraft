@echo off

REM =============

REM Aquí pones la ruta a "C:\...\CurseForge\Instances"
set MODPACK=D:\Pixel\CurseForge\Instances

REM =============













REM =============

REM NO TOCAR NADA

:: Intenta acceder a un directorio protegido para comprobar permisos de administrador
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"

:: Si el acceso falla, muestra un mensaje y cierra el script
if '%errorlevel%' NEQ '0' (
    echo Este script necesita ejecutarse como administrador.
    pause
    exit /b
)

winget install --id Git.Git -e --source winget

pushd "%MODPACK%"

if exist "DawCraft" (
    echo Actualizando el repositorio...
    cd DawCraft
    git pull
) else (
    echo Clonando el repositorio...
    git clone https://github.com/xJP8/DawCraft.git
)


pause
REM =============