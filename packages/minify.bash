#!/usr/bin/env bash

for f in $(ls src); do
  cp -f "src/${f}" .
done

if [ "$(uname)" == 'Darwin' ]; then
  if [ -x /usr/local/bin/gsed ]; then
    for f in $(ls src); do
      gsed -i -e 's/%.\+$/%/g' $f
      gsed -i -z 's/%\n//g' $f
      gsed -i -e 's/\s\+/ /g' $f
      gsed -i -e 's/\(\[\|\]\|{\|}\) /\1/g' $f
      gsed -i -e '/^$/d' $f
    done
  else
    echo 'please install gnu-sed.'
  fi
else
  for f in $(ls src); do
    sed -i -e 's/%.\+$/%/g' $f
    sed -i -z 's/%\n//g' $f
    sed -i -e 's/\s\+/ /g' $f
    sed -i -e 's/\(\[\|\]\|{\|}\) /\1/g' $f
    sed -i -e '/^$/d' $f
  done
fi
