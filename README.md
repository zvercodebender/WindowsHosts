# PetPortalHosts


## Notepad++

```
Invoke-WebRequest https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.8/npp.
7.8.8.bin.zip -OutFile C:\Users\root\Downloads\npp.zip
Expand-Archive -LiteralPath C:\Users\root\Downloads\npp.zip -DestinationPath "C:\Program Files\N
otepad++"
```

## Firefox

```
Invoke-WebRequest "https://download.mozilla.org/?product=firefox-latest-ssl&os=win&lang=en-US" -OutFile C:\Users\root\Downloads\firefoxSetup.exe
```
