echo -e "Please provide an element as an argument."

SEARCH_ELEMENT() {

read SEARCH


if
  SEARCH=($PSQL "SELECT * FROM elements WHERE atomic_number=1 OR symbol='H' OR name=Hydrogen") 
  echo -e "\nThe element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
else
  echo -e "\n I could not find that element in the database."

fi

}
