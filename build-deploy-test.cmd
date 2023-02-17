@echo off
set NOPAUSE=true
set SKIP_WEATHER=true
set DYNAMIC_SCRIPTS_PATH="d:\dev\_VEAF\VEAF-Mission-Creation-Tools"
set DYNAMIC_LOAD_SCRIPTS=
call build.cmd
copy build\*.miz .
pause