@echo off
title MS Office Mini Yardimci Tool
color 0A
mode con cols=100 lines=30
cls

:MENU
cls
echo ===============================
echo   MS Office Mini Yardimci Tool
echo ===============================
echo  Yonetici Olarak Calistirin!
echo #
echo #
echo #
echo 1 - Office crack kalintilarini temizle.(Office rearm)
echo 2 - Office guncellemelerini kapat (Disable Etme)
echo 3 - Office guncellemelerini kapat (127.0.0.1 yonlendirme)
echo 4 - Office guncellemelerini tekrar aktif et (https://officecdn.microsoft.com)
echo 0 - Cikis
echo #
echo.

:: İmza kısmı - sağ alt köşeye yakın
call :DrawSignature

set /p choice=Seciminizi girin: 
if "%choice%"=="1" goto CLEAN_LICENSE
if "%choice%"=="2" goto DISABLE_UPDATES
if "%choice%"=="3" goto REDIRECT_UPDATE_CHANNEL
if "%choice%"=="4" goto ENABLE_UPDATES
if "%choice%"=="0" exit
goto MENU

:CLEAN_LICENSE
echo Office lisanslarini temizleme islemi basliyor...
set "OfficePath=%ProgramFiles(x86)%\Microsoft Office\Office16"
if not exist "%OfficePath%" (
    set "OfficePath=%ProgramFiles%\Microsoft Office\Office16"
)
if not exist "%OfficePath%\OSPP.VBS" (
    echo OSPP.VBS dosyasi bulunamadi. Dogru Office surumu kurulu mu?
    pause
    goto MENU
)
cd /d "%OfficePath%"
echo Mevcut lisanslar kaldiriliyor...
cscript OSPP.VBS /dstatus > "%temp%\office_status.txt"
for /f "tokens=3" %%A in ('findstr "License Name:" "%temp%\office_status.txt"') do (
    cscript OSPP.VBS /unpkey:%%A
)
echo KMS veya crack lisansi kalintilari temizleniyor...
cscript OSPP.VBS /rearm
del "%temp%\office_status.txt"
echo Temizlik islemi tamamlandi. Office 365 lisansi eklemeye hazir!
pause
goto MENU

:DISABLE_UPDATES
echo Office guncellemeleri uygulama uzerinden devre disi birakiliyor...
echo Regedit kayitlari ekleniyor...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v enableautomaticupdates /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v hideenabledisableupdates /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /v disablescf /t REG_DWORD /d 1 /f >nul 2>&1
if %errorlevel%==0 (
    echo Regedit kayitlari eklendi.
    echo Office updateleri disable edildi.
    echo Cihazi yeniden baslatmaniz onerilir.
) else (
    echo Bir hata olustu. Lutfen scripti Yonetici olarak calistirin.
)
pause
goto MENU

:REDIRECT_UPDATE_CHANNEL
echo Office guncelleme kanali degistiriliyor...
echo Regedit kayitlari degistiriliyor...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v UpdateChannel /t REG_SZ /d http://127.0.0.1 /f >nul 2>&1
if %errorlevel%==0 (
    echo Office guncelleme kanali 127.0.0.1'e yonlendirildi.
    echo Cihazi yeniden baslatmaniz onerilir.
) else (
    echo Bir hata olustu. Lutfen scripti Yonetici olarak calistirin.
)
pause
goto MENU

:ENABLE_UPDATES
echo Office guncellemeleri tekrar aktif ediliyor...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" /v UpdateChannel /t REG_SZ /d "https://officecdn.microsoft.com" /f >nul 2>&1
if %errorlevel%==0 (
    echo Office guncellemeleri tekrar aktif edildi.
    echo Cihazi yeniden baslatmaniz onerilir.
) else (
    echo Bir hata olustu. Lutfen scripti Yonetici olarak calistirin.
)
pause
goto MENU


:DrawSignature
echo.                                                                                  Sertac Canbey

exit /b
