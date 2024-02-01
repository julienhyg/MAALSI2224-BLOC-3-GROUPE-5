#!/bin/bash
TITRE="MAALSI 2022 - Projet Collaboratif Bloc 3 - Groupe 5";
if [ -f "${TITRE}.pdf" ]; then
    echo "Le fichier existe, remplacement...";
    rm "${TITRE}.pdf";
    echo "Fichier précédent supprimé"
fi
pandoc metadata.yaml intro.md I.md II.md III.md IV.md V.md VI.md VII.md VIII.md IX.md X.md annexes.md -o "${TITRE}.pdf" --from markdown --template eisvogel --listings --pdf-engine=xelatex;
open "${TITRE}.pdf";