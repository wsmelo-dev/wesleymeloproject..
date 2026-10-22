@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
cd /d "%~dp0"

set "PATH=%PATH%;C:\Program Files\Git\cmd;C:\Program Files\GitHub CLI"

echo ============================================
echo   PUBLICAR O SITE NO GITHUB PAGES
echo   Pasta: %CD%
echo ============================================
echo.

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo [ERRO] Esta pasta nao e um repositorio Git.
  echo        Rode este arquivo dentro da pasta "wesleymelo.com".
  echo.
  pause
  exit /b 1
)

git status --porcelain > "%TEMP%\wsm_status.txt"
for %%A in ("%TEMP%\wsm_status.txt") do set "size=%%~zA"
if "!size!"=="0" (
  echo Nada mudou desde a ultima publicacao. Nao ha o que enviar.
  echo.
  pause
  exit /b 0
)

echo Arquivos que serao publicados:
echo --------------------------------------------
git status --short
echo --------------------------------------------
echo.

set "msg="
set /p "msg=Descreva a mudanca (ou aperte Enter): "
if "!msg!"=="" set "msg=Atualiza o portfolio"

git add -A
git commit -m "!msg!"
if errorlevel 1 (
  echo.
  echo [ERRO] Nao foi possivel fazer o commit.
  echo.
  pause
  exit /b 1
)

echo.
echo Enviando para o GitHub...
git push
if errorlevel 1 (
  echo.
  echo [ERRO] O envio falhou. Verifique a internet e o login do GitHub ^(gh auth status^).
  echo.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   PUBLICADO!
echo   O site atualiza no ar em ate 1 minuto.
echo   Se o navegador mostrar a versao antiga,
echo   aperte Ctrl+F5.
echo ============================================
echo.
pause
