#!/bin/bash

# set -euxo

if [[ "$1" == "-b" ]]; then
    wget -O biblio.bib http://127.0.0.1:23119/better-bibtex/export/collection?/1/Loqu.biblatex
fi

pandoc --metadata-file=./metadata.yml "--metadata=abstract:$(cat ./content/abstract.md)" \
    --bibliography=./biblio.bib \
    --csl="https://www.zotero.org/styles/springer-lecture-notes-in-computer-science" \
    --section-divs --template=./templates/template.html -o dist/out.html content/main.md
