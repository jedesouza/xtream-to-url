@echo off
echo Xtream Codes to URL Converter

echo Options
echo [1] Playlist (without Play Token)
echo [2] XMLTV (EPG)
echo [3] Playlist (with Play Token)
echo Leave blank to select Playlist (without Play Token)

:choice
set /P c=Select Option (1 / 2 / 3)
if /I "%c%" EQU "1" goto :ot
if /I "%c%" EQU "2" goto :xml
if /I "%c%" EQU "3" goto :ot2
goto :ot

:xml
set /P hs="Host (without http://)" 
set /P id="Username:" 
set /P pw="Password:" 
set final="http://%hs%/xmltv.php?username=%id%&password=%pw%"
echo Here's your link:
echo %final%
pause
goto :preexit

:ot
echo Playlist Format
echo [1] M3U
echo [2] M3U Plus
echo [3] Enigma2
echo Leave blank to select M3U Plus
:choice
set /P c=Select Option (1 / 2 / 3)
if /I "%c%" EQU "1" goto :m3u
if /I "%c%" EQU "2" goto :m3up
if /I "%c%" EQU "3" goto :e16
goto :m3up

:m3up
set /P hs="Host (without http://)" 
set /P id="Username:" 
set /P pw="Password:" 
set final="http://%hs%/xmltv.php?username=%id%&password=%pw%&type=m3u_plus"
echo Here's your link:
echo %final%
pause
exit

:m3u
set /P hs="Host (without http://)" 
set /P id="Username:" 
set /P pw="Password:" 
set final="http://%hs%/xmltv.php?username=%id%&password=%pw%&type=m3u"
echo Here's your link:
echo %final%
pause
exit

:e16
set /P hs="Host (without http://)" 
set /P id="Username:" 
set /P pw="Password:" 
set final="http://%hs%/xmltv.php?username=%id%&password=%pw%&type=enigma2"
echo Here's your link:
echo %final%
pause
exit

:ot2
echo Playlist Format
echo [1] M3U
echo [2] M3U Plus
echo [3] Enigma2
echo Leave blank to select M3U Plus
:choice
set /P c=Select Option (1 / 2 / 3)
if /I "%c%" EQU "1" goto :m3u2
if /I "%c%" EQU "2" goto :m3up2
if /I "%c%" EQU "3" goto :e162
goto :m3up2

:m3up2
set /P hs="Host (without http://)" 
set /P id="Username:" 
set /P pw="Password:"
set /P pt="Play Token:" 
set final="http://%hs%/xmltv.php?username=%id%&password=%pw%&type=m3u_plus&play_token=%pt%"
echo Here's your link:
echo %final%
pause
goto :preexit

:m3u2
set /P hs="Host (without http://)" 
set /P id="Username:" 
set /P pw="Password:" 
set /P pt="Play Token:" 
set final="http://%hs%/xmltv.php?username=%id%&password=%pw%&type=m3u&play_token=%pt%"
echo Here's your link:
echo %final%
pause
goto :preexit

:e162
set /P hs="Host (without http://)" 
set /P id="Username:" 
set /P pw="Password:" 
set /P pt="Play Token:" 
set final="http://%hs%/xmltv.php?username=%id%&password=%pw%&type=enigma2&play_token=%pt%"
echo Here's your link:
echo %final%
pause
goto :preexit

:preexit
echo Open in Chrome? (This is also useful for downloading M3U files)
echo [Y] Yes
echo [N] No
:choice
set /P c=Select Option (Y / N)
if /I "%c%" EQU "1" goto :chrome
if /I "%c%" EQU "2" goto :finalexit
goto:finalexit

:chrome
echo Opening...
chrome %final%
exit

:finalexit
exit