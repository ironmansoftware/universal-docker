param(
    $Version
)

Set-Location $PSScriptRoot
docker build . --tag=universal --build-arg VERSION=$Version #--network "Default Switch"