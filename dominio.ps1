<#
  dominio.ps1 Â· Liga o site no dominio proprio (GitHub Pages).
  Deve ser rodado DEPOIS que o DNS do dominio ja apontar para o GitHub Pages.
  Ele: cria o CNAME no repositorio, define o dominio nas Pages, ativa o HTTPS
  forcado, dispara o build e confere se o site respondeu no endereco novo.

  Uso:
    powershell -ExecutionPolicy Bypass -File dominio.ps1 -Dominio "wesleymelo.com"
#>

[CmdletBinding()]
param(
  [string]$Dominio = "wesleymelo.com",
  [string]$TokenFile = "C:\github-token\github_pat_11CO2KIFY0prNDpEia4jAs_r.txt",
  [switch]$PularChecagemDNS
)

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Repo    = "wsmelo-dev/wesleymelo.com"
$ApiBase = "https://api.github.com/repos/$Repo"
$GH_IPS  = @("185.199.108.153","185.199.109.153","185.199.110.153","185.199.111.153")

$token = (Get-Content $TokenFile -Raw).Trim()
$headers = @{
  "Authorization" = "Bearer $token"
  "User-Agent"    = "dominio-ps1"
  "Accept"        = "application/vnd.github+json"
  "X-GitHub-Api-Version" = "2022-11-28"
}

# ---------- 1. o DNS ja aponta? ----------
if (-not $PularChecagemDNS) {
  Write-Host "Verificando DNS de $Dominio ..." -ForegroundColor Cyan
  $ips = @()
  try { $ips = (Resolve-DnsName -Name $Dominio -Type A -ErrorAction Stop | Where-Object { $_.IPAddress }).IPAddress } catch {}
  $ok = $ips | Where-Object { $GH_IPS -contains $_ }
  if (-not $ok) {
    Write-Host ""
    Write-Host "O DNS de $Dominio ainda nao aponta para o GitHub Pages." -ForegroundColor Yellow
    Write-Host "Achei: $($ips -join ', ')" -ForegroundColor DarkGray
    Write-Host "Esperado (um destes): $($GH_IPS -join ', ')" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "Aponte os registros A no seu registrador e rode este script de novo." -ForegroundColor Yellow
    Write-Host "Nao vou mudar nada agora, para o site atual continuar no ar." -ForegroundColor DarkGray
    exit 2
  }
  Write-Host "  DNS ok: $($ips -join ', ')" -ForegroundColor Green
}

# ---------- 2. CNAME no repositorio ----------
Write-Host ""
Write-Host "Criando CNAME no repositorio ..." -ForegroundColor Cyan
$sha = $null
try { $sha = (Invoke-RestMethod -Uri "$ApiBase/contents/CNAME" -Headers $headers -Method Get).sha } catch {}
$body = @{ message = "Conecta o dominio $Dominio"; content = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($Dominio)); branch = "main" }
if ($sha) { $body.sha = $sha }
try {
  Invoke-RestMethod -Uri "$ApiBase/contents/CNAME" -Headers $headers -Method Put -Body ($body | ConvertTo-Json -Depth 5) | Out-Null
  Write-Host "  CNAME = $Dominio" -ForegroundColor Green
} catch { Write-Host "  [ERRO] CNAME :: $($_.Exception.Message)" -ForegroundColor Red }

# ---------- 3. dominio customizado nas Pages + HTTPS ----------
Write-Host "Configurando o dominio nas Pages ..." -ForegroundColor Cyan
try {
  Invoke-RestMethod -Uri "$ApiBase/pages" -Headers $headers -Method Put -Body (@{ cname = $Dominio; https_enforced = $true } | ConvertTo-Json) -ContentType "application/json" | Out-Null
  Write-Host "  dominio definido, HTTPS forcado" -ForegroundColor Green
} catch {
  Write-Host "  [AVISO] nao consegui configurar nas Pages: $($_.Exception.Message)" -ForegroundColor Yellow
}

# ---------- 4. build ----------
Write-Host "Disparando build ..." -ForegroundColor Cyan
try { Invoke-RestMethod -Uri "$ApiBase/pages/builds" -Headers $headers -Method Post -Body "{}" -ContentType "application/json" | Out-Null; Write-Host "  build enfileirado" -ForegroundColor Green }
catch { Write-Host "  [AVISO] build: $($_.Exception.Message)" -ForegroundColor Yellow }

# ---------- 5. conferir ----------
Write-Host ""
Write-Host "Aguardando o certificado do HTTPS (pode levar alguns minutos) ..." -ForegroundColor Cyan
for ($i = 1; $i -le 10; $i++) {
  Start-Sleep -Seconds 20
  try {
    $p = Invoke-RestMethod -Uri "$ApiBase/pages" -Headers $headers -Method Get
    Write-Host ("  [{0}] build={1} https={2} cname={3}" -f (Get-Date -Format HH:mm:ss), $p.status, $p.https_enforced, $p.cname) -ForegroundColor DarkGray
    if ($p.status -eq "built" -and $p.https_enforced -and $p.cname -eq $Dominio) { break }
  } catch { Write-Host "  ...aguardando" -ForegroundColor DarkGray }
}

Write-Host ""
Write-Host "Testando https://$Dominio ..." -ForegroundColor Cyan
try {
  $r = Invoke-WebRequest -Uri "https://$Dominio" -UseBasicParsing -MaximumRedirection 5
  Write-Host "  respondeu $($r.StatusCode) ($($r.Content.Length) bytes)" -ForegroundColor Green
} catch {
  Write-Host "  ainda nao respondeu: $($_.Exception.Message)" -ForegroundColor Yellow
}
Write-Host ""
Write-Host "Site: https://$Dominio/" -ForegroundColor Cyan
Write-Host ""
