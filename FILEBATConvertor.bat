@echo off
title FILEBATConvertor
setlocal enabledelayedexpansion

if "" == "/?" goto usage
if "%~1" == "" (goto usage)

set file=%~dpnx1
title ���� %file%.bat - FILEBATConvertor
echo FILEBATConvertor [Inside Preview Edition Version 0.77.1 Build 76]
echo By WMProject1217
echo.
echo ���ִ�����ȷ���ļ�·����û�пո�������ַ�
echo.
echo [%date% %time%]�������� %file%.bat ...
set Ext=%~x1
if not "%~2" == "" (if "%~2" == "def" (set FileName=%1) else (set FileName=%~2))
if "%~2" == "" (set FileName=%1)
if not "%~3" == "" (if "%~3" == "def" (set OutPath=%%~dp0%) else (set OutPath=%~3))
if "%~3" == "" set (OutPath=%%~dp0%)
%windir%\System32\certutil.exe -encode %file% %file%.tmp >NUL 2>NUL
echo ^@echo off>%file%.bat
echo title ��ѹ %file% - FILEBATConvertor>>%file%.bat
echo echo FILEBATConvertor [Inside Preview Edition Version 0.77.1 Build 76]>>%file%.bat
echo echo By WMProject1217>>%file%.bat
echo echo.>>%file%.bat
echo echo ���ִ����뽫���ļ����õ�û�пո�����������ַ���·�����ù���ԱȨ��ִ��>>%file%.bat
echo echo.>>%file%.bat
echo echo [%date% %time%]���ڴ��н�ѹ %file% ...>>%file%.bat
for /f "delims=" %%i in (%file%.tmp) do (
if "%%i"=="" (
echo.>>%file%.bat
) else (
echo echo.%%i^>^>fc>>%file%.bat
)
)
echo %%windir%%\System32\certutil.exe -decode fc ^"!FileName!^" ^>NUL 2^>NUL>>"%file%.bat"
echo del fc ^>NUL 2^>NUL >>%file%.bat
echo echo [%date% %time%]�ɹ���ѹ %file%>>%file%.bat
echo echo ��������˳�>>%file%.bat
echo pause ^>nul>>%file%.bat
echo exit>>%file%.bat
del %file%.tmp >NUL 2>NUL
echo [%date% %time%]�����ɲ�����Ϊ %file%.bat
echo ��������˳�
pause >nul
goto ems

:usage
echo FILEBATConvertor [Inside Preview Edition Version 0.77.1 Build 76]
echo By WMProject1217
echo.
echo �÷�: %~n0 [Ҫת�����ļ�] [����ļ���] [���·��] [����������� y/n]
echo         [����ļ���]     batת��Ϊ�ļ�ʱ���ļ���     Ĭ��ֵ(def): %%1%
echo         [���·��]       batת��Ϊ�ļ�ʱ���ļ���     Ĭ��ֵ(def): %%~dp0%
echo.
echo.
echo ʾ��: 
echo       %~n0 example.exe                             ^|  ����ļ������ļ�����������ʾ�������
echo       %~n0 example.exe BAT                         ^|  ����ļ�������
echo       %~n0 example.exe def C:\BAT\                 ^|  ����ļ�������
echo       %~n0 example.exe BAT C:\BAT\                 ^|  ����ļ������ļ���
echo.
echo ��������˳�
pause >nul
:ems