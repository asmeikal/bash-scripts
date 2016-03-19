#!/bin/bash

LOW_FREQ="1.6GhZ"
MAX_FREQ="3.0GhZ"
MAX_GOV="performance"
GOVERNOR="powersave"
NPROC=`nproc`

usage() {
	SCRIPT_NAME=`echo $0 | sed -r -e "s/.*\///"`
	echo "Usage: $SCRIPT_NAME [print]"
	echo "With no argument underclocks CPU."
}

underclock() {
	for i in `seq 0 $(( $NPROC - 1))`; do
		echo "Setting cpu $i to ${LOW_FREQ}..."
		sudo cpufreq-set -c $i -u $LOW_FREQ
		sudo cpufreq-set -c $i -g $GOVERNOR
	done
}

overclock() {
	for i in `seq 0 $(( $NPROC - 1))`; do
		echo "Setting cpu $i to ${MAX_FREQ}..."
		sudo cpufreq-set -c $i -u $MAX_FREQ
		sudo cpufreq-set -c $i -g $MAX_GOV
	done
}

printstatus() {
	for i in `seq 0 $(( NPROC - 1))`; do
		var=`cpufreq-info -c $i -p`
		arr=($var)
		min=${arr[0]}
		max=${arr[1]}
		gov=${arr[2]}
		freq=`cpufreq-info -c $i -f -m`
		min=$(( $min / 1000 ))
		max=$(( $max / 1000 ))
		echo "CPU $i: Running at ${freq}, min is ${min}MhZ, max is ${max}MhZ. Governor is $gov."
	done
}

if [[ $# > 1 ]] ; then
	usage
	exit 1
fi

case $1 in
	"print") printstatus
		;;
	"sprint") overclock
		;;
	"") underclock
		;;
	*) usage
		exit 1
		;;
esac

