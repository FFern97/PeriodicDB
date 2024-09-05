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






camper: /project$ mkdir periodic_table
camper: /project$ cd periodic_table/
camper: /periodic_table$ git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint: 
hint:   git config --global init.defaultBranch <name>
hint: 
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint: 
hint:   git branch -m <name>
Initialized empty Git repository in /workspace/project/periodic_table/.git/
camper: /periodic_table$ git checkout -b main
Switched to a new branch 'main'
camper: /periodic_table$ touch element.sh
camper: /periodic_table$ git add .
camper: /periodic_table$ git commit -m "Add element.sh"
[main (root-commit) 0cd2a68] Add element.sh
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 element.sh
camper: /periodic_table$ chmod +x element.sh
camper: /periodic_table$ ./element.sh
Please provide an element as an argument.
camper: /periodic_table$ 1
bash: 1: command not found
camper: /periodic_table$ ./element.sh 1
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
camper: /periodic_table$ ./element.sh O
The element with atomic number 8 is Oxygen (O). It's a nonmetal, with a mass of 15.999 amu. Oxygen has a melting point of -218 celsius and a boiling point of -183 celsius.
camper: /periodic_table$ ./element.sh Neon
The element with atomic number 10 is Neon (Ne). It's a nonmetal, with a mass of 20.18 amu. Neon has a melting point of -248.6 celsius and a boiling point of -246.1 celsius.
camper: /periodic_table$ ./element.sh 14

I could not find that element in the database.
camper: /periodic_table$ ./element.sh 14
\nI could not find that element in the database.
camper: /periodic_table$ ./element.sh 14
I could not find that element in the database.
camper: /periodic_table$ git add .
camper: /periodic_table$ git commit -m "Initial commit"
[main 80ac975] Initial commit
 1 file changed, 38 insertions(+)
 mode change 100644 => 100755 element.sh
camper: /periodic_table$ git log --oneline
80ac975 (HEAD -> main) Initial commit
0cd2a68 Add element.sh
camper: /periodic_table$ git commit --amend -m "Initial commit"
[main d0ef9fa] Initial commit
 Date: Thu Sep 5 03:21:55 2024 +0000
 1 file changed, 38 insertions(+)
 mode change 100644 => 100755 element.sh
camper: /periodic_table$ git log --oneline
d0ef9fa (HEAD -> main) Initial commit
0cd2a68 Add element.sh
camper: /periodic_table$ git rebase -i --root
[detached HEAD 9f202c7] Initial commit
 Date: Thu Sep 5 03:08:36 2024 +0000
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 element.sh
Successfully rebased and updated refs/heads/main.
