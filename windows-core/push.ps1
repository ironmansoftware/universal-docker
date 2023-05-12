param(
    $dockerpwd,
    [Switch]$Preview,
    $Version
)

$TagNames = @("ironmansoftware/universal:$Version-lts-windowsservercore-ltsc2022")

docker login -u adamdriscoll -p $dockerpwd

$TagNames | ForEach-Object {
    docker tag universal $_
    docker push $_
}
