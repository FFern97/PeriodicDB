#!/bin/bash

#if [[ -z $1 ]]; then
  echo -e "Please provide an element as an argument."
#fi

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"


SEARCH_ELEMENT() {

SEARCH=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = $1 OR symbol = '$1' OR name = '$1'")

if [[ -z $SEARCH ]] 
  then 
  echo -e "\n I could not find that element in the database."
  else
  echo -e "\nThe element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE_ID, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_PONIT_CELSIUS celsius."
fi

}

SEARCH_ELEMENT
