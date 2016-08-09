#/bin/sh

currdir=`pwd`

for d in $@ ; do
	for f in `ls -1 $d` ; do
		fname="${currdir}/${f}"
		if [ -L ${fname} ] ; then
			echo "Removing link ${fname}..."
			rm $fname
		elif [ -e ${fname} ] ; then
			echo "mv $fname \"${fname}.bak\""
			mv $fname "${fname}.bak"
		fi
		echo "Installing file ${fname}..."
		stripdir="$(echo "${d}" | tr -d '[[:space:]]')"
		echo "ln -s ${stripdir}/${f} ${fname}"
		ln -s ${stripdir}/${f} ${fname}
	done
done

