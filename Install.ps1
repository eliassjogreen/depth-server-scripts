. .\Variables.ps1

# Download and unzip steamcmd if needed
if (-Not (Test-Path $steamcmd_dir_out)) {
    Write-Output "Downloading steamcmd... (from $steamcmd_zip_url)"
    Invoke-WebRequest -Uri $steamcmd_zip_url -OutFile $steamcmd_zip_out
    Write-Output "Downloaded steamdcmd!"
    Write-Output "Unzipping steamcmd... (file $steamcmd_zip_out)"
    Expand-Archive $steamcmd_zip_out -DestinationPath $steamcmd_dir_out
    Write-Output "Unzipped steamcmd!"
    Write-Output "Removing steamcmd zip file... (file $steamcmd_zip_out)"
    Remove-Item $steamcmd_zip_out
    Write-Output "Removed steamcmd zip file!"
    Write-Output "Initializing steamcmd... (executable $steamcmd_exe)"
    Write-Output "This might take a while..."
    & $steamcmd_exe "+quit" 2>&1 | Out-Null
    Write-Output "Steamcmd initialized!"
}

# Install $steam_app_id to $steam_app_dir
$steam_username = Read-Host "Steam username"
$steam_password = Read-Host "Steam password" -AsSecureString
$steam_guard = Read-Host "Steam guard code" -AsSecureString
$steam_password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($steam_password))
$steam_guard = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($steam_guard))

Write-Output "Installing steam app with app id $steam_app_id to $steam_app_dir..."
Write-Output "This might take a while..."
& $steamcmd_exe "+login $steam_username $steam_password $steam_guard" "+force_install_dir $steam_app_dir" "+app_update $steam_app_id validate" "+quit" 2>&1 | Out-Null
Write-Output "Installation done!"
