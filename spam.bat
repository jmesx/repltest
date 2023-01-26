@echo off
cls
title Webhook Spammer - MrFeast#8218
echo Enter Webhook:
set /p Webhook=
cls
python ./spammer.py %Webhook% true
pause