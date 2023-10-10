@echo off

set Name=rumble-extension
set Project=%userprofile%\OneDrive\Documentos\GitHub\%Name%
set Temp=%userprofile%\OneDrive\Documentos\GitHub\temp
set Seven=C:\Program Files\7-Zip\7z.exe

cd %%

xcopy /s /f %Project% %Temp%

del %Temp%\*.bat
del %Temp%\LICENSE
del %Temp%\chrome.bat
del %Temp%\firefox.bat
del %Temp%\README.md
del %Temp%\*.zip
del %Temp%\manifest-firefox.json

for %%a in ("%Temp%") do set "NTemp=%%~nxa"

Set "Data=%Date%-%Time:~0,5%"
set "Data=%Data:/=-%"
set "Data=%Data::=-%"
set "Data=%Data: =0%
echo %Data%

pushd "%Temp%"

"%Seven%" a -y -tzip "%Temp%\%NTemp% chrome-%Data%.zip" * -x!.git -x!*.bat

del /s %Temp%\css
del /s %Temp%\js 
del /s %Temp%\icons 
del %Temp%\index.html 
del %Temp%\manifest.json 
rmdir %Temp%\css 
rmdir %Temp%\js 
rmdir %Temp%\icons