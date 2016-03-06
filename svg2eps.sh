#!/bin/bash
# As seen on https://thingumabob.wordpress.com/2008/03/17/command-line-scripts-to-convert-svg-files-to-eps-pdf-and-png/

print_usage () {
	echo "usage: $0 inputfile.svg [outputfile.eps]"
}

build_eps_filename () {
	echo "$1" | sed -e 's/.svg/.eps/g'
}

if [ "$1" = "" ] ; then
	print_usage
	exit 1
fi

if [ "$2" = "" ] ; then
	OUTPUT=`build_eps_filename $1`
else
	OUTPUT=$2
fi

echo "Converting $1 to $OUTPUT ..."

inkscape -z -T -E $OUTPUT $1
