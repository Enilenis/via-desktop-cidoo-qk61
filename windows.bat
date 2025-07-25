git clone https://github.com/cebby2420/via-desktop.git via-desktop
xcopy via-desktop\* .\ /E /Y
rmdir via-desktop /S /Q

git clone https://github.com/the-via/app.git via-app
xcopy via-desktop-cidoo-qk61\* .\ /E /Y
rmdir via-desktop-cidoo-qk61 /S /Q

cd via-app
call npm install
powershell -Command "(gc src/utils/device-store.ts) -replace '^\s*//(.*fetch.*)', '$1' -replace '^\s*(const hash = document.getElementById.*)', '//$1' | sc src/utils/device-store.ts"
call npm run build
xcopy dist\* ..\public\ /E /Y

cd ..
rmdir /S /Q via-app