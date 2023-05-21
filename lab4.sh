#!/bin/bash

if [ "$1" == "--date" ]; then
    current_date=$(date)
    echo "Aktualna data: $current_date"
fi

if [ "$1" == "--logs" ]; then
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

if [ "$1" == "--logs" ]; then
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

if [ "$1" == "--help" ]; then
    echo "Dostępne opcje:"
    echo "--logs + liczba: Tworzy określona liczbę plikow log z infosdacjami."
    echo "--help: Wyświetla dostępne opcje."
else
    echo "Użyj --help aby zobaczyc dostępne opcja."
fi