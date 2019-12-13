#!/bin/bash


runthis() {
	echo "$@"
	eval $@
}

jars=$(find $XATKIT -follow \( -name '*.jar' \))
echo 'Xatkit classpath:'
java_classpath=''
for jar in $jars
	do
		echo $jar
		java_classpath="$java_classpath:$jar"
	done

# Remove the leading ';'
java_classpath="${java_classpath:1}"

if [ -z $1 ]
then
	runthis "java -cp '$java_classpath' com.xatkit.Xatkit"
else
	runthis "java -cp '$java_classpath' com.xatkit.Xatkit '$1'"
fi

