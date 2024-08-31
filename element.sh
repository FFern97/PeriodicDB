#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [ $# -eq 0 ]; 
  then
    echo "Please provide an element as an argument."
    exit 0
fi


SEARCH_ELEMENT() {
 
SEARCH=$($PSQL "SELECT atomic_number, symbol, name  FROM elements WHERE atomic_number::TEXT = '$1' OR symbol = '$1' OR name = '$1' ")

if [[ $SEARCH ]] 

  then 
    echo -e "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
  else
    echo -e "\n I could not find that element in the database."
    exit 1 
          #"\nThe element with atomic number $ATOMIC_NUMBER is '$ELEMENT_NAME' ('$ELEMENT_SYMBOL'). It's a $TYPE_ID, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_PONIT_CELSIUS celsius."
fi
}



SEARCH_ELEMENT $1



