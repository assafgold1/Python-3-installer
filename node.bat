@echo off

REM Retrieve the latest version of Node.js
for /f "tokens=2 delims=:" %%a in ('curl -sL https://nodejs.org/dist/latest/ ^| findstr /i "Current"') do (
    set "NODE_VERSION=%%a"
)

REM Generate the download URL for Node.js installer
set "NODE_URL=https://nodejs.org/dist/%NODE_VERSION%/node-%NODE_VERSION%-x64.msi"
set "NODE_INSTALLER=node-installer.msi"

REM Download Node.js installer
curl -L -o %NODE_INSTALLER% %NODE_URL%

REM Install Node.js
msiexec /i %NODE_INSTALLER% /quiet /passive ADDLOCAL=ALL

REM Cleanup the installer
del %NODE_INSTALLER%
