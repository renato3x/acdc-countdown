#!/bin/bash

notify() {
  local message="$1"
  local body=$(
    printf \
      '{"content": "%s", "allowed_mentions": {"parse": ["everyone"]}}' \
      "$message"
  )
  curl -H "Content-Type: application/json" \
    -X POST \
    -d "$body" \
    "$discord_webhook_url"
}

dates=("2026-02-24 00:00:00" "2026-02-28 00:00:00" "2026-03-04 00:00:00")

for date in "${dates[@]}"
do
  today=$(date -d "today 00:00:00" +%s)
  date_in_seconds=$(date -d "$date" +%s)
  remaining_days=$(( (date_in_seconds - today) / 86400 ))
  formatted_date=$(date -d "$date" +"%d-%m-%Y")

  if [ $remaining_days -gt 1 ]; then
    msg="@everyone\nFaltam apenas **$remaining_days dias** para o show do **AC/DC Pwr Up Tour** que ocorrerá no dia **$formatted_date**. Preparem-se. 🤘⚡🎸"
    notify "$msg"
  elif [ $remaining_days -eq 1 ]; then
    msg="@everyone\nFalta **apenas 1 dia** para o show do **AC/DC Pwr Up Tour** que ocorrerá no dia **$formatted_date**. Estamos prestes a ir para a **Highway To hell** 🛣️🔥👹"
    notify "$msg"
  elif [ $remaining_days -eq 0 ]; then
    msg="@everyone\n⚡⚡⚡É HOJE⚡⚡⚡\nO show do AC/DC Pwr Up Tour ocorrerá hoje ($formatted_date). Se preparem, porque é dia de Dirty Deeds Done Dirt Cheap 🤘⚡🤘⚡"
    notify "$msg"
  fi
done
