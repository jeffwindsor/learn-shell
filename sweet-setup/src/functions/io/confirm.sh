function io.confirm()
{   #USAGE: if [ $? -eq 0 ]; then echo ""; fi
    echo -n "$@ [y/N]: "; read -e answer
    for response in y Y yes YES Yes; do
        if [ "_$answer" == "_$response" ]; then
            return 0
        fi
    done
    return 1
}