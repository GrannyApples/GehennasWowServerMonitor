#!/bin/bash

CLIENT_ID="your api client id"
CLIENT_SECRET="your api client secret"
REALM_SLUG="gehennas"
NAMESPACE="dynamic-classic-eu"
REGION="eu"
LOCALE="en_GB"

get_access_token() {
  TOKEN_RESPONSE=$(curl -s -u "$CLIENT_ID:$CLIENT_SECRET" -d grant_type=client_credentials "https://$REGION.battle.net/oauth/token")
  ACCESS_TOKEN=$(echo "$TOKEN_RESPONSE" | jq -r '.access_token')
  if [[ "$ACCESS_TOKEN" == "null" || -z "$ACCESS_TOKEN" ]]; then
    echo "Failed to get access token."
    exit 1
  fi
}

get_connected_realm_id() {
  REALM_RESPONSE=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" \
    "https://$REGION.api.blizzard.com/data/wow/realm/$REALM_SLUG?namespace=$NAMESPACE&locale=$LOCALE")

  CONNECTED_REALM_ID=$(echo "$REALM_RESPONSE" | jq -r '.connected_realm.href' | grep -oE '[0-9]+')
  if [[ -z "$CONNECTED_REALM_ID" ]]; then
    echo "Failed to get connected realm ID."
    exit 1
  fi
}

check_realm_status() {
  STATUS_RESPONSE=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" \
    "https://$REGION.api.blizzard.com/data/wow/connected-realm/$CONNECTED_REALM_ID?namespace=$NAMESPACE&locale=$LOCALE")
  echo "$STATUS_RESPONSE" | jq -r '.status.type // "UNKNOWN"'
}

while true; do
  get_access_token
  get_connected_realm_id
  STATUS=$(check_realm_status)
  echo "$STATUS"
    if [[ "$STATUS" == "UP" ]]; then
  for i in {1..3}; do
    echo "$STATUS"
  done
  #Play wav file
  powershell.exe -c "(New-Object Media.SoundPlayer 'C:\\Windows\\Media\\notify.wav').PlaySync();"
  break
fi
  sleep 10
done

