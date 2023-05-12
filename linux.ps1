param(
    $Version = (Get-Content $PSScriptRoot\version.txt).Trim(),
    [Switch]$Push
)

$Preview = $Version.Contains("beta")

@("ubuntu-7.1.4", "ubuntu-lts", "linux-arm", "linux-arm64", "ubuntu-20.04") | ForEach-Object {
    . "$PSScriptRoot/$_/build.ps1" -Version $Version

    if ($Push) {
        . "$PSScriptRoot/$_/push.ps1" -Preview:$Preview
    }
}