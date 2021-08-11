#!/bin/bash

for f in $(ls src); do
  cp -f "src/${f}" .
  sed -i -e 's/%.\+$/%/g' $f
  sed -i -z 's/%\n//g' $f
  sed -i -e 's/\s\+/ /g' $f
  sed -i -e 's/\(\[\|\]\|{\|}\) /\1/g' $f
  sed -i -e '/^$/d' $f
done
