# Depth Server Scripts
This repository contains three scripts for using and installing the [depth](https://store.steampowered.com/app/274940/Depth/) [dedicated server](https://steamcommunity.com/app/274940/discussions/4/616198900642062316/).

### Installing
To install the server and you will first need to download or clone this repository and then run the `Install.ps1` script using powershell. This will install steamcmd and then prompt you for your steam login. For the scripts to work you need have depth registered in your steam library.

### Cleaning
To remove all of the folders and files associated with the game you simply run the `Clean.ps1` file using powershell and the `server` and `steamcmd` folders will be removed.

### Running
To run the server you simply run the `Run.ps1` file using powershell. The server might not work the first time its run, to fix this you need to navigate to `.\server\Binaries\Win32\` and start `DepthGame.exe` to initialize the game files and the server should work. To connect to the server you need to start `DepthGame.exe` (Can be an normal steam installation) with an command line argument with the ip to the server.

The `Run.ps1` script has multiple command line arguments that can be specified which are the following:
```
-map            - can be any of the following maps: Antiguo, Cove,
                  Crude, Fractured, Olmec, DevilsHead, Galleon, Wreck, 
                  Hillside, Stash, Station, Temple, Breach, OhmBase, Snowfall   (default: Antiguo)
-lan            - true if playing on lan otherwise false                        (default: false)         
-bots           - true if you want to enable bots otherwise false               (default: true)
-humans         - the number of required human players to start the match       (default: 6)
-connections    - the number of connections that the server can handle          (default: 6)
-query_port     - the servers query port                                        (default: 31000)
-port           - the servers port                                              (default: 7777)
```
