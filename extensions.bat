@echo off
setlocal

set DIR=####################################################################################
set DISCORD=https://discord.gg/Dr2nCqZuTQ
echo %DIR%
echo.
echo �� ������ Ȯ�� ����� ��ġ�ϴ� ���α׷��Դϴ�.
echo.
echo %DIR%
call environment.bat

@echo  1. autocompletion - �±� �ڵ��ϼ�
@echo  2. Image browser - �̹��� ������
@echo  3. WD 1.4 Tagger - �°�
@echo  4. ABG_extension - ��� ����
@echo  5. ����                          
echo %DIR%
set /p choice=���ϴ� ����� �������ּ��� ( 1, 2, 3, 4, 5 ) : 
goto :%choice%


:1
echo %DIR%
echo.
echo autocompletion - �±� �ڵ��ϼ� �� �ٿ�ε��ϰڽ��ϴ�.
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git cache/webui/extensions/a1111-sd-webui-tagcomplete

echo %DIR%
pause
Exit
:2
echo %DIR%
echo.
echo  �� �ٿ�ε��ϰڽ��ϴ�.
git clone https://github.com/yfszzx/stable-diffusion-webui-images-browser.git cache/webui/extensions/stable-diffusion-webui-images-browser

echo %DIR%
pause
Exit

:3
echo %DIR%
echo.
echo WD 1.4 Tagger - �°� �� �ٿ�ε��ϰڽ��ϴ�.
git clone https://github.com/toriato/stable-diffusion-webui-wd14-tagger.git cache/webui/extensions/stable-diffusion-webui-wd14-tagger

echo %DIR%
pause
Exit
:4
echo %DIR%
echo.
echo ABG_extension - ��� ���� �� �ٿ�ε��ϰڽ��ϴ�.
git clone https://github.com/KutsuyaYuki/ABG_extension.git cache/webui/extensions/ABG_extension

echo %DIR%
pause
Exit


:5
Exit

