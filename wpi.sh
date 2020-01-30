#!/bin/bash

# apt-get update

function InstallPaquete()
{
    PAQUETE=${1}
    dpkg -s  $PAQUETE 2> /dev/null
    error=$?
    [[ $error -ne 0 ]] && apt-get install $PAQUETE
}
InstallPaquete unzip
InstallPaquete wget

dominio="${1}"
url=${2}
rutaV="/home/admin/web/${dominio}/public_html/"

[[ $error -ne 0 ]] && apt-get install zip

if [[ -d $rutaV ]];then
    echo "ruta actual: $rutaV"; read
    cd $rutaV; rm -rf *; wget $url
    for i in * 
    do
        EXT=${i##*.}
    done
    
    if [[ $EXT == "zip" ]];then
        if [[ $EXT == "zip" ]];then
            unzip $i
        else
            echo "ERROR AL DESCOMPRIMIR ARCHIVO ZIP"
            exit
        fi
    fi
    if [[ $EXT == "gz" ]];then
        if [[ $EXT == "gz" ]];then
            tar zxf $i
        else
            echo "ERROR AL DESCOMPRIMIR ARCHIVO GZ"
            exit
        fi
    fi
    rm -rf ${i} && mv wordpress/* .
    chown admin.admin -R *
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
fi
