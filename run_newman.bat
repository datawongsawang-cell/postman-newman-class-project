@echo off
cd /d "%~dp0"
where newman >nul 2>nul || call npm install -g newman newman-reporter-htmlextra
if not exist reports mkdir reports
call newman run collections\FutureSkill_ClassProject.postman_collection.json ^
  -e environments\JSONPlaceholder.postman_environment.json ^
  -r cli,htmlextra --reporter-htmlextra-export reports\report.html
start "" reports\report.html
pause
