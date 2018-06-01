#!/bin/bash
clear;
prev=$(<prev.data);
rating=(["0"]="Ice Cream" ["10"]="Literally a fridge" ["20"]="Holy Potatoes!" ["30"]="Perfect" ["40"]="Good" ["50"]="Poor" ["60"]="Bad" ["70"]="About to burn your house down" ["150"]="You'll need water. Lots of water.");

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

findRating(){
	echo "Rating your temperature...";
	rate="No Rate Found";
	for i in "${!rating[@]}"; do
		if(($1 > $i)); then
			rate="${rating[$i]}";
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
findRating $avg;
clear;
echo "Results: ";
echo "";
echo "Highest temp: $act 'C";
echo "Average temp: $avg 'C";
echo "Last temp: ${temps[${#temps[@]}]} 'C";
echo "Temp loss: $(($prev - $avg)) 'C";
echo "Rating: $rate";
echo $avg>prev.data;
