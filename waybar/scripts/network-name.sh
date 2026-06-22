#!/bin/bash

state=$(nmcli -t -f STATE general)

case "$state" in
  connected)
    line=$(nmcli -t -f TYPE,NAME connection show --active 2>/dev/null | head -1)
    type=${line%%:*}
    conn=${line#*:}

    if [ -z "$conn" ]; then
      printf "  ?"
      exit 0
    fi

    case "$type" in
      ethernet) printf "  %s" "$conn" ;;
      *)        printf "  %s" "$conn" ;;
    esac
    ;;
  connecting)
    printf "  ..."
    ;;
  *)
    printf "  OFF"
    ;;
esac
