@echo off


rem Netzlaufwerke mehrerer Ziele verbinden. Skript kann
rem beliebig erweitert werden.
rem Angegebene Variablen werden nicht geprueft und es duerfen
rem keine Leerzeichen am Zeilenende der set Befehle stehen!


rem ################################################################
rem
set server1=DV-Hotline
set share1=Word
set lw1=W:
set name1=david
set pw1=david
rem 
set server2=Server-03
set share2=David
set lw2=X:
set name2=weber@speedpoint
set pw2=geheim
rem
set server3=DVServer
set share3=Praxisdaten
set lw3=P:
set name3=david
set pw3=david
rem
set server4=DMPServer
set share4=DMP_Assist_V5
set lw4=Z:
set name4=david
set pw4=david
rem
rem Bei Bedarf hier erweitern sowie unten weitere Steps anfuegen.
rem
rem ################################################################


cls
echo.
echo ----------------------
echo Netzlaufwerkverbindung
echo ----------------------
echo.

ping -n 5 \\127.0.0.1 >nul

rem ----------------------------------------------------------------

for /L %%i IN (1 1 10) do (
echo Verbindung zu %share1% auf %server1% wird hergestellt...
ping -n 1 -w 5000 %server1% | find /i "TTL" >NUL && goto ONLINE1
)

:ONLINE1
if exist %lw1% net use /d /yes %lw1% > NUL
net use %lw1% \\%server1%\%share1% /user:%name1% %pw1% /persistent:no 2>NUL || goto FAIL
echo Laufwerk %lw1% verbunden.
echo.
goto STEP2

rem ----------------------------------------------------------------

:STEP2
for /L %%i IN (1 1 10) do (
echo Verbindung zu %share2% auf %server2% wird hergestellt...
ping -n 1 -w 5000 %server2% | find /i "TTL" >NUL && goto ONLINE2
)

:ONLINE2
if exist %lw2% net use /d /yes %lw2% >NUL
net use %lw2% \\%server2%\%share2% /user:%name2% %pw2% /persistent:no 2>NUL || goto FAIL
echo Laufwerk %lw2% verbunden.
echo.
goto STEP5

rem ----------------------------------------------------------------

:STEP3
for /L %%i IN (1 1 10) do (
echo Verbindung zu %share3% auf %server3% wird hergestellt...
ping -n 1 -w 5000 %server3% | find /i "TTL" >NUL && goto ONLINE3
)

:ONLINE3
if exist %lw3% net use /d /yes %lw3% >NUL
net use %lw3% \\%server3%\%share3% /user:%name3% %pw3% /persistent:no 2>NUL || goto FAIL
echo Laufwerk %lw3% verbunden.
echo.
goto STEP4

rem ----------------------------------------------------------------

:STEP4
for /L %%i IN (1 1 10) do (
echo Verbindung zu %share4% auf %server4% wird hergestellt...
ping -n 1 -w 5000 %server4% | find /i "TTL" >NUL && goto ONLINE4
)

:ONLINE4
if exist %lw4% net use /d /yes %lw4% >NUL
net use %lw4% \\%server4%\%share4% /user:%name4% %pw4% /persistent:no 2>NUL || goto FAIL
echo Laufwerk %lw4% verbunden.
echo.
goto STEP5

rem ----------------------------------------------------------------

:STEP5
if not defined server6 goto ENDOK
echo.

rem ----------------------------------------------------------------

:FAIL
echo.
echo ABBRUCH: Es konnten nicht alle Netzlaufwerke verbunden werden.
echo          Bitte Speedpoint anrufen.
echo.
pause
exit

:ENDOK
rem ################################################################
rem start /MIN "" "C:\Program Files (x86)\FRITZ!\FriFax32.exe" -a
rem ################################################################
echo Ende
ping -n 1 \\127.0.0.1 >nul
exit









