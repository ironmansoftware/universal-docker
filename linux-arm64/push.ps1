param(
    $dockerpwd,
    [Switch]$Preview,
    $Version
)

$TagNames = @("ironmansoftware/universal:$Version-ubuntu-latest-arm64v8")

docker login -u adamdriscoll -p $dockerpwd

$TagNames | ForEach-Object {
    docker tag universal $_
    docker push $_
}
