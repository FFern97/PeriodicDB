#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [ $# -eq 0 ]; 
  then
    echo "Please provide an element as an argument."
    exit 0
fi


SEARCH_ELEMENT() {
    # Buscar el elemento en la base de datos
    SEARCH=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number::TEXT = '$1' OR symbol = '$1' OR name = '$1'" 2>/dev/null)

    # Verificar si la búsqueda fue exitosa
    if [[ -z "$SEARCH" ]]; then
        echo "I could not find that element in the database."
        exit 0
    fi

    # Obtener los detalles del elemento
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number::TEXT='$1' OR symbol = '$1' OR name = '$1'" 2>/dev/null)
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number::TEXT='$1' OR symbol = '$1' OR name = '$1'" 2>/dev/null)
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number::TEXT='$1' OR symbol = '$1' OR name = '$1'" 2>/dev/null)
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER'" 2>/dev/null)
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER'" 2>/dev/null)
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$ATOMIC_NUMBER'" 2>/dev/null)
    TYPE_ID=$($PSQL "SELECT type FROM types WHERE type_id=(SELECT type_id FROM properties WHERE atomic_number='$ATOMIC_NUMBER')" 2>/dev/null)

    # Mostrar los detalles del elemento
    echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE_ID, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}




SEARCH_ELEMENT $1
