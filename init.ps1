if (!(Test-Path ~\AppData\Local\nvim)) {
    Copy-Item -Path $PSScriptRoot -Destination ~\AppData\Local\nvim -Recurse -Exclude 'plugged'
    Write-Host 'Neovim init done'
}