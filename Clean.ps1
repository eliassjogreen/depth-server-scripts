. .\Variables.ps1

if (Test-Path $steamcmd_zip_out) {
    Write-Output "Removing $steamcmd_zip_out..."
    Remove-Item $steamcmd_zip_out -Force
}
if (Test-Path $steamcmd_dir_out) {
    Write-Output "Removing $steamcmd_dir_out..."
    Remove-Item $steamcmd_dir_out -Recurse -Force
}
if (Test-Path $steam_app_dir) {
    Write-Output "Removing $steam_app_dir..."
    Remove-Item $steam_app_dir -Recurse -Force
}

Write-Output "Clean done!"
