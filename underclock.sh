#!/bin/bash

LOW_FREQ="1.6GhZ"
GOVERNOR="powersave"
NPROC=`nproc`
echo "We have $NPROC processors."

underclock() {
	for i in `seq 0 $(( $NPROC - 1))`; do
		echo "Setting cpu $i to ${LOW_FREQ}..."
		sudo cpufreq-set -c $i -u $LOW_FREQ
		sudo cpufreq-set -c $i -g $GOVERNOR
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

case $1 in
	"print") printstatus
		;;
	*) underclock
		;;
esac

