��
cls
@echo off
echo ****************************************
echo               ��ңģ���� ����
echo               Author: ShallowAi
echo               52pojie.cn
echo ****************************************
echo ������ ��ңģ���� ��װλ��, ��������ңģ����ģ�������������
echo �� D:\Program Files\Microvirt\MEmu
:retry
set /p dir=��װλ�ã�
choice /M "��ңģ������װλ���� %dir%, ȷ�������� Y, ���������� N"
if errorlevel 2 goto retry
if errorlevel 1 goto check
:check
if exist "%dir%" goto unexist
echo Ŀ¼������, ����������.
goto retry
:unexist
echo �뱣֤ģ������������!
timeout /t 3
tasklist | find /i "MEmu.exe" >nul 2>nul && goto exist || goto unexist
:exist
cd bin
adb connect 127.0.0.1:21503
adb remount
echo ���ڽ��� ��ңģ���� ϵͳ�ƹ�
adb shell pm clear com.microvirt.launcher2
adb shell "echo "127.0.0.1 microvirt.com" >> /etc/hosts"
adb shell "echo "127.0.0.1 www.microvirt.com" >> /etc/hosts"
echo ����ɾ�� ��ңģ���� Ӧ���̵�
adb shell rm -rf /system/priv-app/Market
echo ����ɾ�� ��ңģ���� �������, ������ȷ���Ƿ�Ϊ��װλ��!
rd /s "%dir%\resources\ad"
rd /s "%dir%\resources\ad2"
rd /s "%dir%\resources\instruction_ad"
echo. > "%dir%\resources\ad"
echo. > "%dir%\resources\ad2"
echo. > "%dir%\resources\instruction_ad"
echo ��ңģ���� �������.
pause