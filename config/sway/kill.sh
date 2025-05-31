#!/bin/dash
# Obtém o PID da janela em foco
pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .pid')

# Se um PID for encontrado, mata o processo
if [ -n "$pid" ]; then
  kill -9 "$pid"
else
  echo "Nenhuma janela focada encontrada ou PID não disponível."
fi
