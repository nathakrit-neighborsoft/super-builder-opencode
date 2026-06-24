$ErrorActionPreference = "Stop"

$RepoOwner = "YOUR_GITHUB_USERNAME"
$RepoName = "super-builder"
$Ref = if ($env:SUPER_BUILDER_REF) {
  $env:SUPER_BUILDER_REF
} else {
  "main"
}
$BaseUrl = if ($env:SUPER_BUILDER_BASE_URL) {
  $env:SUPER_BUILDER_BASE_URL.TrimEnd("/")
} else {
  "https://raw.githubusercontent.com/$RepoOwner/$RepoName"
}

if ($env:OPENCODE_CONFIG_DIR) {
  $ConfigDir = $env:OPENCODE_CONFIG_DIR
} elseif ($env:APPDATA) {
  $ConfigDir = Join-Path $env:APPDATA "opencode"
} else {
  throw "APPDATA is not set. Set OPENCODE_CONFIG_DIR and try again."
}

function Install-AgentFile {
  param(
    [Parameter(Mandatory = $true)]
    [string] $Source,

    [Parameter(Mandatory = $true)]
    [string] $Destination
  )

  $DestinationDir = Split-Path -Parent $Destination
  New-Item -ItemType Directory -Path $DestinationDir -Force | Out-Null

  $Url = "$BaseUrl/$Ref/$Source"
  Invoke-WebRequest -Uri $Url -OutFile $Destination
}

Install-AgentFile -Source "agent.md" -Destination (Join-Path $ConfigDir "agents/super-builder.md")

Write-Host "Installed super-builder agent into: $ConfigDir"
Write-Host "- agents/super-builder.md"
