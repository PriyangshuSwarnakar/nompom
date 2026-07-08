[Setup]
AppName=Chichingpoipoi
AppVersion=2.0
AppPublisher=Priyangshu Swarnakar
AppPublisherURL=https://github.com/PriyangshuSwarnakar
DefaultDirName={autopf}\Chichingpoipoi
DefaultGroupName=Chichingpoipoi
OutputDir=installer_output
OutputBaseFilename=Chichingpoipoi_Setup_v2.0
SetupIconFile=chichingpoipoi.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
UninstallDisplayIcon={app}\Chichingpoipoi.exe

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional icons:"; Flags: unchecked

[Files]
Source: "dist\Chichingpoipoi\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Chichingpoipoi"; Filename: "{app}\Chichingpoipoi.exe"
Name: "{group}\Uninstall Chichingpoipoi"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Chichingpoipoi"; Filename: "{app}\Chichingpoipoi.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\Chichingpoipoi.exe"; Description: "Launch Chichingpoipoi"; Flags: nowait postinstall skipifsilent
