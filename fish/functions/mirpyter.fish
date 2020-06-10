function mirpyter
    if test -z $argv[1] 
        #docker run --rm  -p 8888:8888 -e LOCAL_USER_ID=1000 -v /usr/local/mir/software:/usr/local/mir/software -v (pwd):/workspace -it mirrobots-docker.jfrog.io/mir_xenial_jupyter lab
        docker run --rm  -name "mirpyter" -d -p 8888:8888 -e LOCAL_USER_ID=1000 -v /usr/local/mir/software:/usr/local/mir/software -v (pwd):/workspace -it mir_xenial_jupyter lab
        xdg-open "http://localhost:8888"
    else
        #docker run --rm  -p 8888:8888 -e LOCAL_USER_ID=1000 -v /usr/local/mir/software:/usr/local/mir/software -v "$argv[1]":/workspace -it mirrobots-docker.jfrog.io/mir_xenial_jupyter lab
        docker run --rm -name "mirpyter" -d -p 8888:8888 -e LOCAL_USER_ID=1000 -v /usr/local/mir/software:/usr/local/mir/software -v "$argv[1]":/workspace -it mir_xenial_jupyter labi
        xdg-open "http://localhost:8888"
    end
end
