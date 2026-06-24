$ErrorActionPreference = "Stop"

$RepoOwner = "nathakrit-neighborsoft"
$RepoName = "super-builder-opencode"
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
Install-AgentFile -Source "skills/caveman/SKILL.md" -Destination (Join-Path $ConfigDir "skills/caveman/SKILL.md")
Install-AgentFile -Source "skills/ponytail/SKILL.md" -Destination (Join-Path $ConfigDir "skills/ponytail/SKILL.md")
Install-AgentFile -Source "skills/brainstorming/SKILL.md" -Destination (Join-Path $ConfigDir "skills/brainstorming/SKILL.md")
Install-AgentFile -Source "skills/guidelines/SKILL.md" -Destination (Join-Path $ConfigDir "skills/guidelines/SKILL.md")
Install-AgentFile -Source "skills/grill-design/SKILL.md" -Destination (Join-Path $ConfigDir "skills/grill-design/SKILL.md")
Install-AgentFile -Source "skills/create-plan/SKILL.md" -Destination (Join-Path $ConfigDir "skills/create-plan/SKILL.md")
Install-AgentFile -Source "skills/subagent-driven-development/SKILL.md" -Destination (Join-Path $ConfigDir "skills/subagent-driven-development/SKILL.md")

Write-Host "Installed super-builder agent and skills into: $ConfigDir"
Write-Host "- agents/super-builder.md"
Write-Host "- skills/caveman/SKILL.md"
Write-Host "- skills/ponytail/SKILL.md"
Write-Host "- skills/brainstorming/SKILL.md"
Write-Host "- skills/guidelines/SKILL.md"
Write-Host "- skills/grill-design/SKILL.md"
Write-Host "- skills/create-plan/SKILL.md"
Write-Host "- skills/subagent-driven-development/SKILL.md"
