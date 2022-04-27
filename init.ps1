if (!(Test-Path ~\AppData\Local\nvim)) {
    git clone https://github.com/Enigmaaaa/nvim.git ~\AppData\Local\nvim
    Copy-Item -Path $PSScriptRoot -Destination ~\AppData\Local\nvim -Recurse -Exclude 'plugged'
    Write-Host 'Neovim init done'
}