��
cls
@echo off
echo ****************************************
echo               �ݵ�ģ���� ����
echo               Author: ShallowAi
echo               52pojie.cn
echo ****************************************
echo ������ �ݵ�ģ���� ��װλ��, �����жݵ�ģ����ģ�������������
echo �� D:\DundiEmu
set /p dir=��װλ�ã�
echo �ݵ�ģ������װλ���� %dir%, ȷ����
pause
:unexist
echo �뱣֤ģ����������!
pause
tasklist | find /i "DunDiEmu.exe" >nul 2>nul && goto exist || goto unexist
:exist
copy "bin\nova.apk" "%dir%"
cd /D "%dir%"
adb connect 127.0.0.1:5555
adb -s emulator-5554 remount
echo ����Ϊ �ݵ�ģ���� ��װ���� NovaLauncher ����
adb -s emulator-5554 install nova.apk
echo ���ڽ��� �ݵ�ģ���� �ƹ�����
adb -s emulator-5554 shell pm disable com.ddmnq.launcher
echo ����ɾ�� �ݵ�ģ���� Ӧ���̵�
adb -s emulator-5554 shell rm -rf /system/priv-app/AppStore
echo ����ɾ�� �ݵ�ģ���� �������, ��ر�ģ���� ����ȷ���Ƿ�Ϊ��װλ��!
taskkill /IM DunDiEmu.exe
rd /s "%dir%\DundiData\cache\resource"
echo. > "%dir%\DundiData\cache\resource"
echo �ݵ�ģ���� �������.
pause