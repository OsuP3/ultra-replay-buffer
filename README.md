I was tired of some issues with other instant replay software so I created this to add some features to OBS replay buffer.

This includes: Notification noise and/or Notification popup on replay save. You may also click the popup to instantly play the clip. I wanted this to open automatically on login, so when the startup is enabled it also opens OBS with replay buffer and ignore shutdown warning. To automatically run the script on startup, select the option in the installer or in the executable.

## Settings:
- You can set your preferences in the OBS-Ultra-Replay-Buffer settings gui (OBS-Ultra-Replay-Buffer.exe), the gui also has an auto-setup to fetch your OBS settings.
- I recommend setting a default scene in the gui so the right one is picked on startup.

## Dependencies:
- Only works with OBS Version <32.0.0 as a necessary tag was removed. please use [OBS 31.1.2](https://github.com/obsproject/obs-studio/releases/tag/31.1.2).
- If you're working with the python, it works with Python 3.11, there are two automatic package downloads.
- To build the installer, Inno Setup is required.

## Build:
1. `python3 .\src\build.py`  (build executables)
2. `ISCC .\installer\installer.iss` (build installer)
- Standalone installer exe is found in `installer_out/`
- App exes found in `dist/`
- Cleanup with `python3 .\src\build.py clean`

## Development:
- `app.py` for settings gui
- `app.py --service` for background service
