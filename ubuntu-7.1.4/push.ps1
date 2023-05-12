param(
    $dockerpwd,
    [Switch]$Preview,
    $Version
)

$TagNames = @("ironmansoftware/universal:$Version-ubuntu-18.04-ps-7.1.4")

docker login -u adamdriscoll -p $dockerpwd

$TagNames | ForEach-Object {
    docker tag universal $_
    docker push $_
}
