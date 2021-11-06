## About
This project contains the script which uploads a set of rules to your Hue Bridge, allowing a _single_ Hue Dimmer switch to control _two groups of lights_ a.k.a. rooms, instead of default one group.

See the [wiki](https://github.com/dtruebin/hue-multidim/wiki) for additional information about the switch layout.

## Guide
1. Create config based on the sample:
    ```bash
    $ cp etc/hue-multidim.conf.sample etc/hue-multidim.conf
    ```
2. Open hue-multidim.conf and set variable values. If you need help identifying the correct values, refer to the following pages of Hue API documentation:
    - `HUB_IP` and `API_KEY` — [Getting Started](https://www.developers.meethue.com/documentation/getting-started).
    - `OUTER_GROUP_ID` and `INNER_GROUP_ID` — [Groups](https://developers.meethue.com/develop/hue-api/groupds-api/#get-all-groups).
    - `DIMMER_SENSOR_ID` — [Sensors](https://developers.meethue.com/develop/hue-api/5-sensors-api/#get-all-sensors).  
    Among your sensors, look for the one having `"type": "ZLLSwitch"`.
    - `FIRST_RULE_ID` — [Rules](https://developers.meethue.com/develop/hue-api/6-rules-api/#get-all-rules).  
    Among your rules, look for the one having `"name": "Dimmer Switch X on0"`. This rule will exist, provided you already set up your Hue Dimmer switch using the app. The script will update 12 consecutive rules beginning with this rule.
3. Run the script:
    ```bash
    $ ./hue-multidim-setup.sh
    ```
