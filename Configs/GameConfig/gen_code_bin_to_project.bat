Cd /d %~dp0
echo %CD%

set WORKSPACE=../..
set LUBAN_DLL=%WORKSPACE%\Tools\Luban\Luban.dll
set CONF_ROOT=.
set DATA_OUTPATH=%WORKSPACE%/ProjectAlpha/Assets/AssetRaw/Configs/bytes/
set CODE_OUTPATH=%WORKSPACE%/ProjectAlpha/Assets/GameScripts/HotFix/GameProto/GameConfig/

xcopy /s /e /i /y "%CONF_ROOT%\CustomTemplate\ConfigSystem.cs" "%WORKSPACE%\ProjectAlpha\Assets\GameScripts\HotFix\GameProto\ConfigSystem.cs"

dotnet %LUBAN_DLL% ^
    -t client ^
    -c cs-bin ^
    -d bin^
    --conf %CONF_ROOT%\luban.conf ^
    -x outputCodeDir=%CODE_OUTPATH% ^
    -x outputDataDir=%DATA_OUTPATH% 
pause

