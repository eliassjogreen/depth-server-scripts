param (
    [string]$map = "Antiguo", # Antiguo, Cove, Crude, Fractured, Olmec, DevilsHead, Galleon, Wreck, Hillside, Stash, Station, Temple, Breach, OhmBase, Snowfall
    [bool]$lan = $false,
    [bool]$bots = $true,
    [int]$humans = 6,
    [int]$connections = 6,
    [int]$query_port = 31000,
    [int]$port = 7777
)

. .\Variables.ps1

if (-Not (Test-Path $steamcmd_dir_out) -or -Not (Test-Path $steam_app_dir)) {
    Write-Output "Installing..."
    .\Install.ps1
}

if ((Test-Path $steamcmd_dir_out) -and (Test-Path $steam_app_dir)) {
    Write-Output "Starting server..."
    & $server_exe "$map?Game=DepthGame.DPGameInfo?bIsLanMatch=$lan?NumberOfHumans=$humans?NumPublicConnections=$connections$(If (-Not $bots) {"?NoBots"})" "-queryport=$query_port" "-nullhri" "-PORT=$port"
}
