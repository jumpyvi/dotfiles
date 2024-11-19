#!/bin/bash
find $(pwd) -name "*.md" -exec sh -c 'for mdfile; do
    htmlfile="${mdfile%.md}.html"
    pandoc "$mdfile" -o "$htmlfile"
done' sh {} +

