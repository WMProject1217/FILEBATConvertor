@echo off
title FILEBATConvertor
setlocal enabledelayedexpansion

if "" == "/?" goto usage
if "%~1" == "" (goto usage)

set file=%~dpnx1
title 生成 %file%.bat - FILEBATConvertor
echo FILEBATConvertor [Inside Preview Edition Version 0.77.1 Build 76]
echo By WMProject1217
echo.
echo 出现错误请确定文件路径中没有空格和特殊字符
echo.
echo [%date% %time%]正在生成 %file%.bat ...
set Ext=%~x1
if not "%~2" == "" (if "%~2" == "def" (set FileName=%1) else (set FileName=%~2))
if "%~2" == "" (set FileName=%1)
if not "%~3" == "" (if "%~3" == "def" (set OutPath=%%~dp0%) else (set OutPath=%~3))
if "%~3" == "" set (OutPath=%%~dp0%)
%windir%\System32\certutil.exe -encode %file% %file%.tmp >NUL 2>NUL
echo ^@echo off>%file%.bat
echo title 解压 %file% - FILEBATConvertor>>%file%.bat
echo echo FILEBATConvertor [Inside Preview Edition Version 0.77.1 Build 76]>>%file%.bat
echo echo By WMProject1217>>%file%.bat
echo echo.>>%file%.bat
echo echo 出现错误请将此文件放置到没有空格和其它特殊字符的路径中用管理员权限执行>>%file%.bat
echo echo.>>%file%.bat
echo echo [%date% %time%]正在从中解压 %file% ...>>%file%.bat
for /f "delims=" %%i in (%file%.tmp) do (
if "%%i"=="" (
echo.>>%file%.bat
) else (
echo echo.%%i^>^>fc>>%file%.bat
)
)
echo %%windir%%\System32\certutil.exe -decode fc ^"!FileName!^" ^>NUL 2^>NUL>>"%file%.bat"
echo del fc ^>NUL 2^>NUL >>%file%.bat
echo echo [%date% %time%]成功解压 %file%>>%file%.bat
echo echo 按任意键退出>>%file%.bat
echo pause ^>nul>>%file%.bat
echo exit>>%file%.bat
del %file%.tmp >NUL 2>NUL
echo [%date% %time%]已生成并保存为 %file%.bat
echo 按任意键退出
pause >nul
goto ems

:usage
echo FILEBATConvertor [Inside Preview Edition Version 0.77.1 Build 76]
echo By WMProject1217
echo.
echo 用法: %~n0 [要转换的文件] [输出文件名] [输出路径] [隐藏输出窗口 y/n]
echo         [输出文件名]     bat转换为文件时的文件名     默认值(def): %%1%
echo         [输出路径]       bat转换为文件时的文件夹     默认值(def): %%~dp0%
echo.
echo.
echo 示例: 
echo       %~n0 example.exe                             ^|  输出文件名和文件夹任意且显示输出窗口
echo       %~n0 example.exe BAT                         ^|  输出文件夹任意
echo       %~n0 example.exe def C:\BAT\                 ^|  输出文件名任意
echo       %~n0 example.exe BAT C:\BAT\                 ^|  输出文件名和文件夹
echo.
echo 按任意键退出
pause >nul
:ems