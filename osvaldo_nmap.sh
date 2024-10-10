#!/bin/bash

# Logo personalizado de "Osvaldo"
logo_osvaldo() {
    echo "=========================="
    echo "     Osvaldo Nmap Scan    "
    echo "=========================="
    echo "   _______________        "
    echo "  |               |       "
    echo "  |    OSVALDO    |       "
    echo "  |_______________|       "
    echo "=========================="
}

# Función para realizar un escaneo básico
basic_scan() {
    echo "Iniciando escaneo básico en $1..."
    nmap -sS -Pn "$1"
}

# Función para realizar un escaneo de puertos abiertos
open_ports_scan() {
    echo "Iniciando escaneo de puertos abiertos en $1..."
    nmap --open "$1"
}

# Función para realizar un escaneo detallado con información del sistema operativo
detailed_scan() {
    echo "Iniciando escaneo detallado con detección de SO en $1..."
    nmap -A -v "$1"
}

# Función principal para el menú de selección
main_menu() {
    logo_osvaldo
    echo "Seleccione el tipo de escaneo que desea realizar:"
    echo "1) Escaneo Básico"
    echo "2) Escaneo de Puertos Abiertos"
    echo "3) Escaneo Detallado (con información de SO)"
    echo "4) Salir"
    read -p "Opción: " option

    case $option in
        1)
            read -p "Ingrese la dirección IP o rango a escanear: " target
            basic_scan "$target"
            ;;
        2)
            read -p "Ingrese la dirección IP o rango a escanear: " target
            open_ports_scan "$target"
            ;;
        3)
            read -p "Ingrese la dirección IP o rango a escanear: " target
            detailed_scan "$target"
            ;;
        4)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida, intente de nuevo."
            main_menu
            ;;
    esac
}

# Ejecución del menú principal
main_menu
