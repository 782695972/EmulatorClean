��
cls
@echo off
echo ****************************************
echo               �׵�ģ����4 ����
echo               Author: ShallowAi
echo               52pojie.cn
echo ****************************************
echo ������ �׵�ģ����4 ��װλ��, �������׵�ģ�������������
echo �� D:\leidian\LDPlayer
set /p dir=��װλ�ã�
echo �׵�ģ������װλ���� %dir%, ȷ����
pause
:unexist
echo �뱣֤ģ����������!
pause
tasklist | find /i "dnplayer.exe" >nul 2>nul && goto exist || goto unexist
:exist
cd bin
adb connect 127.0.0.1:5555
adb -s emulator-5554 remount
echo ����Ϊ �׵�ģ���� ��װ���� NovaLauncher ����
adb -s emulator-5554 install nova.apk
echo ���ڽ��� �׵�ģ���� �ƹ�����
adb -s emulator-5554 shell pm disable com.android.launcher3
echo ����ж�� �׵�ģ���� Ӧ���̵�
adb -s emulator-5554 shell rm -rf /system/priv-app/ldAppStore
echo ��ر��������е�ģ����.
taskkill /f /im dnplayer.exe
echo ����ɾ�������� �׵�ģ���� �������������ƹ�, ������ȷ���Ƿ�Ϊ��װλ�ã�
del /p /f "%dir%\ldnews.exe"
rd /s "%appdata%\leidian\cache"
rd /s "%appdata%\ChangZhi\cache"
rd /s "%appdata%\ChangZhi2\cache"
copy .\cache "%appdata%\leidian"
copy .\cache "%appdata%\ChangZhi"
copy .\cache "%appdata%\ChangZhi2"
echo �׵�ģ���� �������.
pause