; Inno Setup Script for Better OBS Replay Buffer
; Download Inno Setup from: https://jrsoftware.org/isdl.php

#define MyAppName "Better Replay Buffer"
#define MyAppVersion "1.0"
#define MyAppPublisher "BetterReplayBuffer"
#define MyAppExeName "BetterReplayBuffer.exe"

[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=installer_output
OutputBaseFilename=BetterReplayBuffer_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "startupicon"; Description: "Run on Windows startup"; GroupDescription: "Startup:"; Flags: unchecked

[Files]
Source: "dist\BetterReplayBuffer.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\BetterReplayBufferService.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\notification.wav"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\settings.example.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\README.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Start Menu shortcut (makes it searchable)
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
; Desktop shortcut (optional)
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
; Startup shortcut (optional)
Name: "{userstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: startupicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
; Kill the service before uninstalling
Filename: "taskkill"; Parameters: "/F /IM BetterReplayBufferService.exe"; Flags: runhidden; RunOnceId: "KillService"
Filename: "taskkill"; Parameters: "/F /IM BetterReplayBuffer.exe"; Flags: runhidden; RunOnceId: "KillGUI"

[UninstallDelete]
; Clean up settings and temp files
Type: files; Name: "{app}\settings.txt"
Type: files; Name: "{%TEMP}\obs_toast.pid"
Type: files; Name: "{%TEMP}\obs_toast.lock"
