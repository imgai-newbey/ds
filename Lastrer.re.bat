::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN60qF9RCGmyDe8d5UL2dJtg41MXtMQLA1Z8ewGiaQF5q3cPkXaAMsmQugHkWQW68l40EmpnyWrTg0s=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJgZksaHErQXA==
::ZQ05rAF9IBncCkqN+0xwdVsEAlTMbCXoZg==
::ZQ05rAF9IAHYFVzEqQIcKQhAXgGQcnm/Zg==
::eg0/rx1wNQPfEVWB+kM9LVsJDCiDL3+oA6dS+u2b
::fBEirQZwNQPfEVWB+kM9LVsJDCiDL3+oA6dS+u2b
::cRolqwZ3JBvQF1fEqQIcKQhAXgGQcnm/Zg==
::dhA7uBVwLU+EWHWF51YiLQkaXgHi
::YQ03rBFzNR3SWATE2EMjPAlRXkqQOQs=
::dhAmsQZ3MwfNWATE2EMjPAlRXkqQOQs=
::ZQ0/vhVqMQ3MEVWAtB9wBBpHWBaHLiWoA9U=
::Zg8zqx1/OA3MEVWAtB9wBBpHWBaHLiWoA9U=
::dhA7pRFwIByZRRmo9VEkOh5GAhaHXA==
::Zh4grVQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN47fpza24iiIfMH+ED2O4QomH9Cnas=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
echo ################################################################################
echo 이 파일은 파이썬과 Git이 자동으로 설치되고 환경설정까지 됩니다. 
echo 만약 파이썬이 설치되어있으면 지우는걸 권장합니다.
echo ################################################################################

if exist cache (
    echo ################################################################################
    echo 처음 실행한게 아니군요! webui가 실행할준비중입니다.
    goto :sp_install
) else (
    echo ################################################################################
    echo cache 폴더가 없어 만들겠습니다.
    goto :install_run
)


:sp_install
call environment.bat
echo 환경 구성파일 설정완료!!
cd cache/webui
set /p choice=webui 인자값을 넣어주세요 :
set ACCELERATE="venv\Scripts\python.exe"
%ACCELERATE% launch.py --autolaunch --opt-sub-quad-attention --xformers --no-half --ckpt-dir "%~dp0models\Stable-diffusion" %choice% 
echo ################################################################################

echo 오류가 발생했습니다.
pause
exit /b



:install_run
echo ################################################################################
echo ################################################################################
mkdir cache
echo 초기 구성파일 다운로드 curl 이용

curl -O https://raw.githubusercontent.com/imgai-newbey/ds/main/environment.bat
echo ################################################################################
curl -L -o unzip.exe https://www.dropbox.com/s/isf6qfmvct5ymxo/unzip.exe?dl=0
echo ################################################################################
curl -L -o system.zip https://www.dropbox.com/s/qmo6lmd3fo8lz4i/system.zip?dl=0
echo ################################################################################
curl -L -o venv.zip https://www.dropbox.com/s/6xyy5wzw7zk3rz5/venv.zip?dl=0

move venv.zip %~dp0cache
move system.zip %~dp0cache
move unzip.exe %~dp0cache

echo ################################################################################

cd cache
%~dp0cache/unzip.exe system.zip
%~dp0cache/unzip.exe venv.zip
del system.zip
del unzip.exe
del venv.zip
echo git 과 python 설치 완료

cd ..
call environment.bat

set DIR=%~dp0cache
set PIP_INSTALLER_LOCATION=%DIR%\Python\get-pip.py
set PYT="%~dp0cache\webui\venv\Scripts\Python.exe"

python %PIP_INSTALLER_LOCATION%
echo 파이썬 업데이트 됨

echo ################################################################################
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git cache/webui
echo ################################################################################
echo ################################################################################

echo 성공적으로 깃허브 커밋했습니다.
echo 환경 구성파일 설정완료!!
move %~dp0cache/venv %~dp0cache/webui
mkdir models\Stable-diffusion
goto :sp_install





