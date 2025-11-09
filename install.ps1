#!/usr/bin/env pwsh

using namespace System.Management.Automation

$documentsPath = [Environment]::GetFolderPath([Environment+SpecialFolder]::MyDocuments)
$customMapPath = Join-Path -Path ([WildcardPattern]::Escape($documentsPath)) -ChildPath "My Games/Beyond the Sword(J)/PublicMaps"
if (-Not (Test-Path -LiteralPath $customMapPath)) {
  $customMapPath = Join-Path -Path ([WildcardPattern]::Escape($documentsPath)) -ChildPath "My Games/Beyond the Sword/PublicMaps"
}
if (-Not (Test-Path -LiteralPath $customMapPath)) {
  throw "The PublicMaps path does not exist."
}
Write-Output $customMapPath

$scriptPath = $PSScriptRoot
$publicMapsPath = Join-Path -Path ([WildcardPattern]::Escape($scriptPath)) -ChildPath "PublicMaps"
Copy-Item -Path (([WildcardPattern]::Escape($publicMapsPath)) + "/*") -Destination $customMapPath -Recurse -Verbose
