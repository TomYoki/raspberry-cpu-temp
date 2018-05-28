#!/bin/bash
clear;

loadTemp(){
	toNum $(vcgencmd measure_temp);
	temps[$1]=$temp;
	echo "${temps[$1]} 'C";
}

findAvg(){
	echo "Finding average temp...";
	avg=0;
	for i in "${temps[@]}"; do
		val=$(echo $i | awk '{print int($1+0.5)}');
		avg=$(($avg+$val));
	done
	avg=$(($avg/${#temps[@]}));
}

findHighest(){
	echo "Finding highest temp...";
	hi=0;
	act=0;
	for i in "${temps[@]}"; do
		round=$(echo $i | awk '{print int($1+0.5)}');
		if(($round>$hi)); then
				 hi=$round;
				act=$i;
		fi;
	done
}

toNum(){
	temp=$(sed 's/[^0-9 | \.]*//g' <<< $1);
}

for i in {1..100}; do
	echo "Run #$i";
	loadTemp $i;
	sleep 1;
	clear;
done

findHighest;
findAvg;
clear;
echo "Results: ";
echo "";
echo "Highest temp: $act 'C";
echo "Average temp: $avg 'C";
echo "Last temp: ${temps[${#temps[@]}]} 'C";
