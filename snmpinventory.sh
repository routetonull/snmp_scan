	#!/bin/bash
	community=MYCOMMUNITY
	while IFS='' read -r line || [[ -n "$line" ]]; do
	hostname=$(snmpwalk -v 2c -c $community -O v -L n $line 1.3.6.1.4.1.9.2.1.3 | sed 's/^.*://g' | sed 's/"//g')
	model=$(snmpwalk -v 2c -c $community -O v -L n $line 1.3.6.1.2.1.47.1.1.1.1.13.1001 | sed 's/^.*://g' | sed 's/"//g')
	serial=$(snmpwalk -v 2c -c $community -O v -L n $line 1.3.6.1.4.1.9.5.1.2.19 | sed 's/^.*://g' | sed 's/"//g')
	echo -e $line'\t'$hostname'\t'$model"\t"$serial
	done < "$1"
