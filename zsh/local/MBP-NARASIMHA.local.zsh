# add /usr/texbin to PATH, if available
[ -d "/usr/texbin" ] && path=(/usr/texbin $path)

alias QA='workon QA; cd ~/Projects/QA'

alias start_selenium='cd ~/Projects/QA/webdriver/MacOSX/; sh start_webdriver.sh'
