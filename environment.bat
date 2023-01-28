@echo off

set DIR=%~dp0cache

set PATH=C:\Windows\system32;C:\Windows;%DIR%\git\bin;%DIR%\Python;%DIR%\Python\Scripts
set PY_LIBS=%DIR%\Python\Scripts\Lib;%DIR%\Python\Scripts\Lib\site-packages
set PY_PIP=%DIR%\Python\Scripts
set SKIP_VENV=1
set PIP_INSTALLER_LOCATION=%DIR%\Python\get-pip.py
set TRANSFORMERS_CACHE=%DIR%\transformers-cache
