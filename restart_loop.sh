#!/bin/bash
while true
do
    # Añade todos los cambios al área de preparación de Git
    git add .

    # Guarda la fecha y hora actuales en una variable
    currentDateTime=$(date "+%Y-%m-%d %H:%M:%S")

    # Realiza un commit con estos cambios
    git commit -m "Saved - $currentDateTime"

    # Se hace un pull con rebase antes de los demás comandos
    git pull --rebase

    # Sube estos cambios a GitHub
    git push origin master

    # Inicia el servidor
    java -Xmx18G @libraries/net/minecraftforge/forge/1.19.4-45.0.66/unix_args.txt

    read -r should_restart < ./auto_restart/restart
    if [ $should_restart = "0" ]
    then
        break
    fi
    echo 'If you want to stop the server completely, press CTRL-C, before the countdown is at 1!'
    echo "Rebooting in:"
    for i in 5 4 3 2 1
    do
        echo "$i..."
        sleep 1
    done
    echo 'Server restart!'
done
