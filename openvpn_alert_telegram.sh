#!/bin/bash

#init
initCount=0
logs=/var/log/openvpn.log

#File
msg_caption=/tmp/telegram_msg_caption.txt

#Chat ID dan bot token Telegram
chat_id="84dawdawdawdawd3011899"
token="19awdaw26:Adawd2VdawdawdawFlawdawdawdk"

#kirim
function sendAlert
{
        curl -s -F chat_id=$chat_id -F text="$caption" https://api.telegram.org/bot$token/sendMessage #> /dev/null 2&>1
}

#Monitoring Server
while true
do
    lastCount=$(wc -c $logs | awk '{print $1}') #getSizeFileLogs
    #DEBUG ONLY
    #echo before_last $lastCount #ex 100 #after reset 0
    #echo before_init $initCount #ex 0
    #echo "--------------------"

    if(($(($lastCount)) > $initCount));
       then
        #DEBUG
        #echo "Kirim Alert..."
        msg=$(tail -n 2 $logs) #GetLastLineLog
        echo -e "openvpn login alert!!!\n\nServer Time : $(date +"%d %b %Y %T")\n\n"$msg > $msg_caption #set Caption / Pesan
        caption=$(<$msg_caption) #set Caption
        sendAlert #Panggil Fungsi di function
        echo "Alert Terkirim"
        initCount=$lastCount
        rm -f $msg_caption
        sleep 1
    fi
    sleep 2 #delay if Not Indication
done