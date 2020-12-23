function mirc
    docker exec -it -e 'TERM=xterm-256color' -w '/workspaces/' $argv[1] bash
end
