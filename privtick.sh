#!/bin/bash

if [ -z "$NO_COLOR" ]; then
  : "${COLOR_BOLD:=\e[1;37m}"
  : "${COLOR_GREEN:=\e[32m}"
  : "${COLOR_RED:=\e[31m}"
  : "${COLOR_RESET:=\e[00m}"
fi



# Enter your API Keys here
APIKEY=""
APIKEY2=""
APIKEY3=""
APIKEY4=""

while [ "$#" -gt 0 ]; do
        key=${1}

        case ${key} in
                --dero)
                        UUID="9jgCbgZ_J9mj-"
                        COIN="DERO"
                        shift
                        ;;
		--xhv)
                        UUID="LNwV-bDextjE-"
                        COIN="XHV"
                        shift
                        ;;
		--ergo)
                        UUID="rfIHB4cXI"
                        COIN="ERGO"
                        shift
                        ;;
		--wow)
                        UUID="-o7TnjYKF"
                        COIN="WOW"
                        shift
                        ;;
                -a|--api-key)
                        APIKEY=${2}
                        shift
                        ;;       
                -a2|--api-key2)
                        APIKEY=${APIKEY2}
                        shift
                        ;;
                -a3|--api-key3)
                        APIKEY=${APIKEY3}
                        shift
                        ;;			
                -a4|--api-key4)
                        APIKEY=${APIKEY4}
                        shift
                        ;;
                *)
                        shift
                        ;;
        esac
done



k=0
j=0

# COIN UUIDs
#XHVuuid="LNwV-bDextjE-"
#DEROuuid="9jgCbgZ_J9mj-"
#ERGOuuid="rfIHB4cXI"
#WOWuuid="-o7TnjYKF"

while true; do
	clear
	echo "===================$COIN==================="
	echo " "
	echo "                    24h                    "
	echo " "
	DERO=`curl -s https://api.coinranking.com/v2/coin/$UUID/price -H 'x-access-token: $APIKEY' -G | jq ".data.price" | sed -e 's/\"//g' | bc -l | xargs printf "%.2f"`
	DERO24[$k]=${DERO}
	DEROCHG=`echo "scale=2; ((${DERO24[$k]} - ${DERO24[$j]})*100)/100" | bc`
	PCTCHG=`echo "scale=6; (${DEROCHG} / ${DERO24[$j]})*100" | bc`

	if [ "$DEROCHG" == "0" ] || [ "$DEROCHG" == "0.0" ]; then
		color=
	elif ( echo "$DEROCHG" | grep -q ^- ); then
		color=$COLOR_RED
	else
		color=$COLOR_GREEN
	fi

	printf "     $COLOR_BOLD%8.2f$COLOR_RESET" $DERO
	printf "$color%10.2f%12s$COLOR_RESET" $DEROCHG $(printf "(%.2f%%)" $PCTCHG)

	if [[ $k -gt 287 ]]; then
		let j++
	fi
	let k++

	echo " "
	echo " "
	echo -ne "===================$COIN==================="
	sleep 300
done



