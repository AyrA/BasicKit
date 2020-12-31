@ECHO OFF
SETLOCAL
PUSHD "%~dp0"
IF "%ZIP%"=="" GOTO FIND7Z
IF NOT EXIST "%ZIP%" GOTO WRONGZIP

:GETINFO
REM Extract version information
SET TMP_FILE=%TEMP%\%RANDOM%.txt
node getinfo.js name >"%TMP_FILE%"
SET /P MOD_NAME= <"%TMP_FILE%"
node getinfo.js version >"%TMP_FILE%"
SET /P MOD_V= <"%TMP_FILE%"
DEL "%TMP_FILE%"
SET DIRNAME=%MOD_NAME%_%MOD_V%
IF "%DIRNAME%"=="_" GOTO NONODE
GOTO ARC

:ARC
REM Create release structure
ROBOCOPY /MIR "mod" "%DIRNAME%"
COPY LICENSE "%DIRNAME%"
COPY README.MD "%DIRNAME%"

REM Archive and cleanup
IF EXIST "%DIRNAME%.zip" DEL "%DIRNAME%.zip"
"%ZIP%" a "%DIRNAME%.zip" "%DIRNAME%"
RD /S /Q "%DIRNAME%"
GOTO END

:FIND7Z
REM Try searching path variable first
SET ZIP=7z.exe
%ZIP% i > NUL
IF "%ERRORLEVEL%"=="0" GOTO GETINFO

REM Try to locate in the 64 bit program directory
SET ZIP=%ProgramFiles%\7-zip\7z.exe
IF EXIST "%ZIP%" GOTO GETINFO

REM Try to locate in the 32 bit program directory
SET ZIP=%ProgramFiles(x86)%\7-zip\7z.exe
IF EXIST "%ZIP%" GOTO GETINFO

CLS
ECHO 7-zip not found. Please install in a global location,
ECHO or define the ZIP variable to point to 7z.exe
GOTO END

:WRONGZIP
ECHO ZIP variable defined as "%ZIP%"
ECHO This application cannot be found.
GOTO END

:NONODE
ECHO nodeJS is not installed.
GOTO END

:END
POPD
ENDLOCAL
PAUSE
