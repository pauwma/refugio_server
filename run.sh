#!/usr/bin/env sh

# Se hace un pull antes de los demás comandos
git pull --rebase

# Añade todos los cambios al área de preparación de Git
git add .

# Guarda la fecha y hora actuales en una variable
currentDateTime=$(date "+%Y-%m-%d %H:%M:%S")

# Realiza un commit con estos cambios
git commit -m "Saved - $currentDateTime"

# Sube estos cambios a GitHub
git push origin master

# Inicia el servidor
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.19.4-45.0.66/unix_args.txt --nogui "$@"

exit
