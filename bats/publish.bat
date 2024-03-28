set /p message=Enter your commit message and press Enter:
cmd /k "cd /d ../&&git add .&&git commit -m "%message%" &&git push&&mkdocs build&&mkdocs gh-deploy"