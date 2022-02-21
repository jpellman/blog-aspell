#!/bin/bash

for DOC in $(git diff --name-only HEAD HEAD~1 | grep 'md$'); do
	if [ -f ${DOC} ]; then
		echo ${DOC}:
		if [ -f $(pwd)/.aspell.en.pws ]; then
			aspell pipe check --mode=markdown --lang=en --personal=$(pwd)/.aspell.en.pws < ${DOC} 2> /dev/null | grep '^&' || echo None
		else
			aspell pipe check --mode=markdown --lang=en < ${DOC} 2> /dev/null | grep '^&' || echo None
		fi
		echo
	fi
done
