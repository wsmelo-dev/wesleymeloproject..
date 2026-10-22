<#
  publicar.ps1 Â· Publica o site no GitHub Pages sem precisar de Git instalado.
  Usa a API do GitHub (Contents API) para enviar os arquivos da pasta para o
  repositÃ³rio wsmelo-dev/wesleymelo.com, branch main.

  Como usar:
    1. Crie um token em https://github.com/settings/tokens (Fine-grained,
       repositÃ³rio: apenas wsmelo-dev/wesleymelo.com,
       permissÃµes: Contents -> Read and write).
    2. Salve o token em um arquivo:  %USERPROFILE%\.github-token
       (no Bloco de Notas: "Salvar como" -> tipo "Todos os arquivos", para
        nÃ£o ficar .txt)
    3. Rode:  powershell -ExecutionPolicy Bypass -File publicar.ps1
       (ou clique duas vezes em publicar-api.bat)

  O script mostra o que vai mudar antes de mudar. Com -Force ele nÃ£o pergunta.
  O site no ar atualiza em ate 1 minuto.
#>

[CmdletBinding()]
param(
  [string]$Message = "Atualiza o site",
  [string]$Branch  = "main",
  [string]$TokenFile = "",
  [switch]$Force
)

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Repo    = "wsmelo-dev/wesleymelo.com"
$ApiBase = "https://api.github.com/repos/$Repo"

# ---------- credencial ----------
# 1) variavel de ambiente GITHUB_TOKEN
# 2) arquivo apontado por -TokenFile
# 3) arquivo padrao %USERPROFILE%\.github-token
# 4) perguntando no console (o token nao fica gravado em disco)
function Get-Token {
  $t = $env:GITHUB_TOKEN
  if (-not $t -and $TokenFile) {
    if (Test-Path $TokenFile) { $t = (Get-Content $TokenFile -Raw).Trim() }
  }
  if (-not $t) {
    $f = Join-Path $env:USERPROFILE ".github-token"
    if (Test-Path $f) { $t = (Get-Content $f -Raw).Trim() }
  }
  if (-not $t) {
    Write-Host ""
    Write-Host "Cole o token do GitHub (nao sera gravado em disco)." -ForegroundColor Yellow
    $sec = Read-Host "Token" -AsSecureString
    $ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec)
    $t = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)
    [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
    $t = $t.Trim()
  }
  if (-not $t) {
    Write-Host "Token nao encontrado." -ForegroundColor Red
    Write-Host "https://github.com/settings/tokens" -ForegroundColor DarkGray
    exit 1
  }
  return $t
}

$token = Get-Token
$headers = @{
  "Authorization" = "Bearer $token"
  "User-Agent"    = "publicar-ps1"
  "Accept"        = "application/vnd.github+json"
  "X-GitHub-Api-Version" = "2022-11-28"
}

# ---------- o que entra e o que sai ----------
$publish = @(
  "index.html",
  "certificados.html",
  "DESIGN.md",
  "PRODUCT.md",
  "publicar.bat",
  "publicar.ps1",
  "publicar-api.bat",
  "dominio.ps1",
  "assets/fluxo-n8n.png",
  "assets/passo-consulta-http.png",
  "assets/passo-javascript.png",
  "assets/passo-envio-crm.png"
)
$remove = @("foto.jpg", "style.css", "script.js")

function Get-Remote([string]$path) {
  try {
    $r = Invoke-RestMethod -Uri "$ApiBase/contents/$path" -Headers $headers -Method Get
    return [pscustomobject]@{ sha = $r.sha; bytes = [Convert]::FromBase64String(($r.content -replace "\s","")) }
  } catch {
    return $null
  }
}

function Compare-Bytes($a, $b) {
  if ($a.Length -ne $b.Length) { return $true }
  for ($i = 0; $i -lt $a.Length; $i++) { if ($a[$i] -ne $b[$i]) { return $true } }
  return $false
}

# ---------- 1. Conference ----------
Write-Host ""
Write-Host "CONFERINDO $Repo ($Branch)" -ForegroundColor Cyan
Write-Host "----------------------------------------"

$plano = @()
foreach ($f in $publish) {
  $local = Join-Path $PSScriptRoot $f
  if (-not (Test-Path $local)) { Write-Host "  [local ausente] $f" -ForegroundColor DarkGray; continue }
  $lb = [IO.File]::ReadAllBytes($local)
  $rem = Get-Remote $f
  if ($rem -and -not (Compare-Bytes $lb $rem.bytes)) {
    Write-Host ("  [igual]      {0}" -f $f) -ForegroundColor DarkGray
  } else {
    Write-Host ("  [ATUALIZAR]  {0}" -f $f) -ForegroundColor Yellow
    $plano += @{ arquivo = $f; bytes = $lb; sha = $(if ($rem) { $rem.sha } else { $null }) }
  }
}
foreach ($f in $remove) {
  $rem = Get-Remote $f
  if ($rem) { Write-Host ("  [REMOVER]    {0}" -f $f) -ForegroundColor Yellow }
}

if ($plano.Count -eq 0) {
  Write-Host "----------------------------------------"
  Write-Host "Nada a fazer: o repositorio ja esta igual a esta pasta." -ForegroundColor Green
  Write-Host ""
  exit 0
}

if (-not $Force) {
  Write-Host ""
  $ok = Read-Host "Publicar assim? (s/N)"
  if ($ok -ne "s" -and $ok -ne "S") { Write-Host "Cancelado." -ForegroundColor Yellow; exit 0 }
}

# ---------- 2. Envio ----------
Write-Host ""
Write-Host "PUBLICANDO" -ForegroundColor Cyan
Write-Host "----------------------------------------"

foreach ($p in $plano) {
  $b64 = [Convert]::ToBase64String($p.bytes)
  $body = @{ message = "$Message : $($p.arquivo)"; content = $b64; branch = $Branch }
  if ($p.sha) { $body.sha = $p.sha }
  try {
    Invoke-RestMethod -Uri "$ApiBase/contents/$($p.arquivo)" -Headers $headers -Method Put -Body ($body | ConvertTo-Json -Depth 5) | Out-Null
    Write-Host ("  [enviado]  {0}" -f $p.arquivo) -ForegroundColor Green
  } catch {
    Write-Host ("  [ERRO] {0} :: {1}" -f $p.arquivo, $_.Exception.Message) -ForegroundColor Red
  }
}

foreach ($f in $remove) {
  $rem = Get-Remote $f
  if (-not $rem) { continue }
  $body = @{ message = "$Message : remove $f"; sha = $rem.sha; branch = $Branch }
  try {
    Invoke-RestMethod -Uri "$ApiBase/contents/$f" -Headers $headers -Method Delete -Body ($body | ConvertTo-Json -Depth 5) | Out-Null
    Write-Host ("  [removido] {0}" -f $f) -ForegroundColor Green
  } catch {
    Write-Host ("  [ERRO ao remover] {0} :: {1}" -f $f, $_.Exception.Message) -ForegroundColor Red
  }
}

Write-Host "----------------------------------------"
Write-Host "Site: https://wsmelo-dev.github.io/wesleymelo.com/  (atualiza em ate 1 minuto)" -ForegroundColor Cyan
Write-Host ""
