#!/usr/bin/env bash
IP=$(ip route get 1 2>/dev/null | grep -oP 'src \K[\d.]+' || hostname -I 2>/dev/null | awk '{print $1}')
echo "LEAKED IP : ${IP:-No IP}"
