#!/bin/bash


function subdir(){
    echo "O numero de sub-diretórios no diretorio atual é: "
    find . -type -d | wc -l
    exit 0
}

function subdir_l(){
    echo "O uso do diretorio, classificado em ordem decrescente, é o seguinte: "
    find . -type d | du | sort -nr
    exit 0
}

function file_l(){
    echo "O numero de arquivos no diretorio atual é: "
    find . -type -f | wc -l
    exit 0
}

function file_d(){
    echo "Os arquivos, classificado em ordem decrescente, é o seguinte: "
    find . -type f -exec ls -al {} \; | sort -k 5 -nr | sed 's/ \+/\t/g' | cut -f5,9
    exit 0
}

function sou_root(){
    if [[ $EUID -eq 0 ]]
     then
        echo "Você é Root"
    else
        echo "Você não é Root"
    fi
    exit 0
}

function status(){
    echo "Hostname: $(hostname)"
    echo "Data Atual: $(date)"
    echo "Versão atual do kernel e arquitetura da CPU: $(uname -rp)"
    echo -e "\n"
    echo "Uso de CPU: "
    sar -u 1 1| grep -v 'Linux'
    echo -e "\n"
    echo "Uso de RAM: "
    sar -r 1 1| grep -v 'Linux'
    echo -e "\n"
    echo "Uso de SWAP: "
    sar -S 1 1| grep -v 'Linux'
    echo -e "\n"
    echo "Atual I/O do disco: "
    sar -d 1 1| grep -E "(DEV|sd|vd)" | grep -v 'Linux'
    echo -e "\n"
    echo "Uso atual da largura de banda: "
    sar -n DEV 1 1| grep -v lo | grep -v "Linux"
    echo -e "\n"
    exit


}

function filtra(){
    read -p "Digite o diretorio para onde copiar o arquivo: " DESTIR
    echo -e "\n"

    if [[ '$DESTIR' == '' ]];
    then echo "Você deve especificar um diretorio."
    else
        if [[ ! -d '$DESTIR' ]];
        then echo "Diretorio $DESTIR deve existir. Saindo."
        exit
        fi
    fi

    echo "Digite os critérios de denotação de numero para pesquisa: "
    echo "1 - Por nome "
    echo "1 - Por dono "
    echo "1 - Por extensão "
    echo -e "\n"
    read CRIT

    case $CRIT in
        1)
            read -p "Digite o nome para pesquisar: " NAME
            echo -n "\n"
            if [[ ! -z $NAME=='' ]]
                then find / -name "$NAME" -exec cp {} $DESTIR \; 2> /dev/null
            else
                echo "Você tem que digitar o nome!"
            fi
        ;;

        2)
            read -p "Digite o propretário para pesquisar: " OWNER
            echo -n "\n"
            if [[ ! -z $OWNER=='' ]]
            then find / -user "$OWNER" -exec cp {} $DESTIR \; 2> /dev/null
            else
                echo "Você tem que digitar o propretário!"
            fi
        ;;

        3)
            read -p "Digite a extensão para pesquisar: " CEXT
            echo -n "\n"
            if [[ ! -z $CEXT=='' ]]
            then find / -type f -name "$CEST" -exec cp {} $DESTIR \; 2> /dev/null
            else
                echo "Você tem que digitar tipo de extensão!"
            fi
        ;;

    esac
}


