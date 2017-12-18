#!/bin/bash

echo "Reading config..."
if [ -r etc/hue-multidim.conf ]; then
  . etc/hue-multidim.conf
fi

echo "Uploading dimmer rules to your Hue Bridge..."
for RULE_NUMBER in {1..12}; do
  echo -e "-------------------\n${RULE_NUMBER}:"

  cat rules/${RULE_NUMBER}.json \
    | sed "s/DIMMER_SENSOR_ID/${DIMMER_SENSOR_ID}/g
           s/OUTER_GROUP_ID/${OUTER_GROUP_ID}/g
           s/INNER_GROUP_ID/${INNER_GROUP_ID}/g" \
    | curl --request PUT \
      --url http://${HUB_IP}/api/${API_KEY}/rules/${RULE_NUMBER} \
      --header 'content-type: application/json' \
      --data @- \
    | json_pp
done