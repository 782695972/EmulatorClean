��
cls
@echo off
echo ****************************************
echo.
echo               �׵�ģ����9 ����
echo               Author: ShallowAi
echo.
echo ****************************************
echo ������ �׵�ģ����9 ��װλ��, �������׵�ģ�������������
echo �� D:\leidian\LDPlayer9
:retry
set /p dir=��װλ�ã�
choice /M "�׵�ģ������װλ���� %dir%, ȷ�������� Y, ���������� N"
if errorlevel 2 goto retry
if errorlevel 1 goto check
:check
if exist "%dir%" goto unexist
echo Ŀ¼������, ����������.
goto retry
:unexist
echo �뱣֤ģ������������!
timeout /t 3
tasklist | find /i "dnplayer.exe" >nul 2>nul && goto exist || goto unexist
:exist
cd bin
adb connect 127.0.0.1:5555
echo ����Ϊ �׵�ģ���� ��װ���� NovaLauncher ����
adb -s emulator-5554 install nova.apk
echo ���ڽ��� �׵�ģ���� �ƹ�����
adb -s emulator-5554 shell pm disable-user com.android.launcher3
adb -s emulator-5554 shell pm disable-user com.ldmnq.launcher3
echo ����ж�� �׵�ģ���� Ӧ���̵�
adb -s emulator-5554 shell pm uninstall --user 0 com.android.flysilkworm
echo �����ر��������е�ģ����.
taskkill /f /im dnplayer.exe
echo ����ɾ�������� �׵�ģ���� �������������ƹ�, ������ȷ���Ƿ�Ϊ��װλ�ã�
del /p /f "%dir%\ldnews.exe"
mkdir "%dir%\ldnews.exe"
rd /s "%appdata%\leidian\cache"
rd /s "%appdata%\leidian64\cache"
rd /s "%appdata%\leidian9\cache"
rd /s "%appdata%\ChangZhi\cache"
rd /s "%appdata%\ChangZhi2\cache"
echo. > "%appdata%\leidian\cache"
echo. > "%appdata%\leidian64\cache"
echo. > "%appdata%\leidian9\cache"
echo. > "%appdata%\ChangZhi\cache"
echo. > "%appdata%\ChangZhi2\cache"
echo �׵�ģ���� �������.
pause