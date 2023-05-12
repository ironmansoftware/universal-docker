param(
    $dockerpwd,
    [Switch]$Preview,
    $Version
)

$TagNames = @()

if ($Preview) {
    $TagNames = @("ironmansoftware/universal:$Version-ubunutu-20.04-ps-7.3.0", "ironmansoftware/universal:preview")
}
else {
    $TagNames = @("ironmansoftware/universal:$Version-ubunutu-20.04-ps-7.3.0", "ironmansoftware/universal:latest")
}

docker login -u adamdriscoll -p $dockerpwd

$TagNames | ForEach-Object {
    docker tag universal $_
    docker push $_
}
