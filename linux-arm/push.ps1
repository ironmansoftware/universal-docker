param(
    $dockerpwd,
    [Switch]$Preview,
    $Version
)

$TagNames = @("ironmansoftware/universal:$Version-ubunutu-18.04-arm32v7")

docker login -u adamdriscoll -p $dockerpwd

$TagNames | ForEach-Object {
    docker tag universal $_
    docker push $_
}
