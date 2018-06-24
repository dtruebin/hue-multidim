#!/bin/bash

echo "Reading config..."
if [ ! -r etc/hue-multidim.conf ]; then
  echo "Unable to read config, quitting."
  exit 0
fi
. etc/hue-multidim.conf

echo "Uploading dimmer rules to your Hue Bridge..."
for RULE_NUMBER in $(seq ${FIRST_RULE_ID} $((${FIRST_RULE_ID}+11)) ); do
  echo -e "-------------------\n${RULE_NUMBER}:"

  # Files containing the rules are numbered 1 through 12, so we need to map
  # each RULE_NUMBER to the corresponding file with rule.
  RULE_FILE=rules/$((${RULE_NUMBER}-${FIRST_RULE_ID}+1)).json

  cat $RULE_FILE \
    | sed "s/DIMMER_SENSOR_ID/${DIMMER_SENSOR_ID}/g
           s/OUTER_GROUP_ID/${OUTER_GROUP_ID}/g
           s/INNER_GROUP_ID/${INNER_GROUP_ID}/g" \
    | curl --request PUT \
      --url http://${HUB_IP}/api/${API_KEY}/rules/${RULE_NUMBER} \
      --header 'content-type: application/json' \
      --data @- \
    | json_pp
done
