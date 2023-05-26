#!/bin/bash

TWITCH_CLIENT_ID=$1
TWITCH_CLIENT_SECRET=$2
TWITCH_USER_ID=$3

TWITCH_TOKEN=$(curl -s -X POST -d "client_id=${TWITCH_CLIENT_ID}&client_secret=${TWITCH_CLIENT_SECRET}&grant_type=client_credentials" "https://id.twitch.tv/oauth2/token" | jq -r '.access_token' )

is_empty=$(curl -s -H "Authorization: Bearer ${TWITCH_TOKEN}" -H "Client-ID: ${TWITCH_CLIENT_ID}" "https://api.twitch.tv/helix/streams?user_id=${TWITCH_USER_ID}" | jq -r '.data | length == 0')

if [[ $is_empty == "true" ]]; then
  echo "Offline"
  exit 1
else
  echo "Live"
  exit 0
fi