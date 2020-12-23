if command -v "ssh"
    set CMD (which ssh)
    function ssh
        TERM=xterm-256color $CMD $argv
    end
end
