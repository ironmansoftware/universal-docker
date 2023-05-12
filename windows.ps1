param(
    $Version = (Get-Content $PSScriptRoot\version.txt).Trim(),
    [Switch]$Push
)

$Preview = $Version.Contains("beta")

@("windows-core") | ForEach-Object {
    . "$PSScriptRoot/$_/build.ps1" -Version $Version

    if ($Push) {
        . "$PSScriptRoot/$_/push.ps1" -Preview:$Preview
    }
}