��
cls
@echo off
echo ****************************************
echo               ҹ��ģ���� ����
echo               Author: ShallowAi
echo               52pojie.cn
echo ****************************************
echo ������ ҹ��ģ���� ��װλ��, ������ҹ��ģ����ģ�������������
echo �� D:\Program Files\Nox
set /p dir=��װλ�ã�
echo ҹ��ģ������װλ���� %dir%, ȷ����
pause
:unexist
echo �뱣֤ģ����������!
pause
tasklist | find /i "Nox.exe" >nul 2>nul && goto exist || goto unexist
:exist
copy "bin\nova.apk" "%dir%\bin"
cd /D "%dir%\bin"
adb connect 127.0.0.1:62001
adb remount
echo ����Ϊ ҹ��ģ���� ��װ���� NovaLauncher ����
adb install nova.apk
echo ���ڽ��� ҹ��ģ���� �ƹ�����
adb shell pm disable com.vphone.launcher
echo ����ɾ�� ҹ��ģ���� Ӧ���̵�
adb shell rm -rf /system/priv-app/AppStore
echo ����ɾ�� ҹ��ģ���� �������, ������ȷ���Ƿ�Ϊ��װλ��!
del /p /f %appdata%\..\Local\Nox\loading\ads
mkdir %appdata%\..\Local\Nox\loading\ads
echo ҹ��ģ���� �������.
pause