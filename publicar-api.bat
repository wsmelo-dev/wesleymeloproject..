@echo off
chcp 65001 >nul
title Publicar site no GitHub Pages (sem Git)
cd /d "%~dp0"

echo ============================================
echo   PUBLICAR O SITE - VIA API DO GITHUB
echo   Pasta: %CD%
echo ============================================
echo.
echo Se o token nao estiver em %USERPROFILE%\.github-token,
echo ele sera pedido aqui (nao fica gravado em disco).
echo.

set /p "msg=Descreva a mudanca (ou aperte Enter): "
if "%msg%"=="" set "msg=Atualiza o site"

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0publicar.ps1" -Message "%msg%"
echo.
pause
