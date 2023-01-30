@echo off
setlocal

set DIR=####################################################################################
set DISCORD=https://discord.gg/Dr2nCqZuTQ
echo %DIR%
echo.
echo 이 파일은 확장 기능을 설치하는 프로그램입니다.
echo.
echo %DIR%
call environment.bat

@echo  1. autocompletion - 태그 자동완성
@echo  2. Image browser - 이미지 브라우저
@echo  3. WD 1.4 Tagger - 태거
@echo  4. ABG_extension - 배경 제거
@echo  5. 종료                          
echo %DIR%
set /p choice=원하는 기능을 선택해주세요 ( 1, 2, 3, 4, 5 ) : 
goto :%choice%


:1
echo %DIR%
echo.
echo autocompletion - 태그 자동완성 를 다운로드하겠습니다.
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git cache/webui/extensions/a1111-sd-webui-tagcomplete

echo %DIR%
pause
Exit
:2
echo %DIR%
echo.
echo  를 다운로드하겠습니다.
git clone https://github.com/yfszzx/stable-diffusion-webui-images-browser.git cache/webui/extensions/stable-diffusion-webui-images-browser

echo %DIR%
pause
Exit

:3
echo %DIR%
echo.
echo WD 1.4 Tagger - 태거 를 다운로드하겠습니다.
git clone https://github.com/toriato/stable-diffusion-webui-wd14-tagger.git cache/webui/extensions/stable-diffusion-webui-wd14-tagger

echo %DIR%
pause
Exit
:4
echo %DIR%
echo.
echo ABG_extension - 배경 제거 를 다운로드하겠습니다.
git clone https://github.com/KutsuyaYuki/ABG_extension.git cache/webui/extensions/ABG_extension

echo %DIR%
pause
Exit


:5
Exit

