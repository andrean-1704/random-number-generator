#!/bin/bash

printf 'Number length [1-100]: '

read lth

lthr=$((lth - 1))

printf 'Times generate [1-100]: '
read hgt

mkdir .temp

if [ $lth -eq 1 ]
then
echo ' for i in {1..height}; do printf $((1 + $RANDOM % 9)); echo; done ' > .temp/executor.sh
elif [ $lth -ge 2 ]
then
echo ' for i in {1..height}; do printf $((1 + $RANDOM % 9));for i in {1..length}; do printf $((0 + $RANDOM % 9)) ;done; echo; done ' > .temp/executor.sh
else
echo [ERROR]: insert number that more than zero
fi

{ printf "sed -i -e 's/length/"; printf $lthr; printf "/g' .temp/executor.sh " ;} > .temp/length.sh
{ printf "sed -i -e 's/height/"; printf $hgt; printf "/g' .temp/executor.sh " ;} > .temp/height.sh

sh .temp/height.sh
sh .temp/length.sh
echo ---START---
bash .temp/executor.sh
echo ----END----

rm -r .temp/
echo ""
