#!/bin/bash
PS3='Select Environment: '
options=("VirtualBox" "Other")
select opt in "${options[@]}"
do
  case "$opt" in
    "VirtualBox")
      DISK=sda
      PORT=2222
      HOST=127.0.0.1
      break
      ;;
    "Other")
      DISK=vda
      PORT=22
      echo -n "HOST: "
      read HOST
      break
      ;;
    *) echo Invalid;;
  esac
done

echo DISK="$DISK", PORT="$PORT", HOST="$HOST"

HOST_ROOT="root@$HOST"
HOST_USER="will@$HOST"

ssh -tt -p "$PORT" "$HOST_USER" "mkdir ~/install"

# copy install scripts from ./root folder
scp -P "$PORT" ./scripts/* "$HOST_USER:~/install"
scp -r -P "$PORT" ../../shell "$HOST_USER:~"

# run the install script remotely
ssh -tt -p "$PORT" "$HOST_USER" "~/install/user.sh $DISK"

ssh -tt -p "$PORT" "$HOST_USER" "rm -rf ~/install"
