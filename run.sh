#!/bin/sh


while getopts f:o:a: options;
do	case "$options" in
	f)
		f="$OPTARG"
		echo "Jar file: $OPTARG"
		;;
	o)	
		if [ "$OPTARG" != '-a' ] && [ "$OPTARG" != '-f' ] ; then
			o="$OPTARG"
			echo "Java Options: $OPTARG"
		fi
		;;
	a)	
		if [ "$OPTARG" != '-o' ] && [ "$OPTARG" != '-f' ] ; then
			a="$OPTARG"
			echo "App args: $OPTARG"
		fi
		;;
	*)	
		echo "No matches"
		exit 1
		;;
	esac
done

## Permform some validation on input arguments, one example below
if [ -z "$f" ] ; then
        echo "No se recibio JAR_FILE"
fi

#Executing
echo "Running..."
echo "java ${o} -jar ${f} ${a}"
java ${o} -jar ${f} ${a}
