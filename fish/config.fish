set fish_greeting

# Set powerline
function fish_prompt
    eval /usr/bin/powerline-go -error $status -shell bare  -cwd-mode plain -theme "/home/cmg/Tools/tools-and-config/powerline-go-theme.json" -modules "venv,user,ssh,cwd,perms,git,hg,exit"
end
