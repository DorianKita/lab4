#!/bin/bash

if [[ "$1" == "--date" || "$1" == "-date" ]]; then
    current_date=$(date)
    echo "Aktualna data: $current_date"
fi

if [ ["$1" == "--logs" || "$1" == "-logs"] ]; then
    for ((i=1; i<=100; i++))
    do
        filename="log$i.txt"
        echo "Nazwa pliku: $filename" > $filename
        echo "Nazwa skryptu: $0" >> $filename
        echo "Data utworzenia: $(date)" >> $filename
    done
    echo "Utworzono 100logów"
else
    echo "nienzana flaga!"
fi

if [ ["$1" == "--logs" || "$1" == "-logs"] ]; then
    if [ -z "$2" ]; then
        echo "Podaj liczbę plików do utworzenia."
    else
        logs=$2
        for ((i=1; i<=logs; i++))
        do
            filename="log$i.txt"
            echo "Nazwa pliku: $filename" > $filename
            echo "Nazwa skryptu: $0" >> $filename
            echo "Data utworzenia: $(date)" >> $filename
        done
        echo "Utworzono $logs plików log"
    fi
else
    echo "Użyj --logs + liczba, aby utworzyć określoną liczbę logów."
fi

if [ ["$1" == "--help" || "$1" == "-help"] ]; then
    echo "Dostępne opcje:"
    echo "--logs + liczba: Tworzy określona liczbę plikow log z infosdacjami."
    echo "--help: Wyświetla dostępne opcje."
else
    echo "Użyj --help aby zobaczyc dostępne opcja."
fi



if [ "$1" == "--init" ]; then
    git clone https://github.com/DorianKita/lab4.git
    repo=$(basename -s .git lab4.git)
    export PATH="$PATH:$(pwd)/$repo"
    echo "Repozytorium zostało pomyślnie sklonowane do katalogu $(pwd)/$repo"
    echo "Ścieżka daodana do zmiennej środowiskowej PATH"
else
    echo "Użyj --init,  aby sklonować repozytorium i dodać do PATH."
fi



if [ "$1" == "--init" ]; then
   
    git clone https://github.com/DorianKita/lab4.git

    repo_name=$(basename -s .git lab4.git)
    export PATH="$PATH:$(pwd)/$repo_name"

    echo "Repozytorium zostało pomyślnie sklonowane do katalogu $(pwd)/$repo_name"
    echo "Ścieżka została dodana do zmiennej środowiskowej PATH"
elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    if [ -z "$2" ]; then
        num_errors=100
    else
        num_errors=$2
    fi

    for ((i=1; i<=num_errors; i++))
    do
        error_dir="error$i"
        error_file="$error_dir/error$i.txt"
        mkdir -p "$error_dir"
        echo "Error $i" > "$error_file"
    done

    echo "Utworzono $num_errors plików error"
else
    echo "Użyj --init, --error +liczba lub -e + liczab, aby użyć odpowiedniej funkcjonalności."
fi
