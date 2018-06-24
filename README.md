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
    - `OUTER_GROUP_ID` and `INNER_GROUP_ID` — [Groups](https://www.developers.meethue.com/documentation/groups-api#21_get_all_groups).
    - `DIMMER_SENSOR_ID` — [Sensors](https://www.developers.meethue.com/documentation/sensors-api#51_get_all_sensors).  
    Among your sensors, look for the one having `"type": "ZLLSwitch"`.
    - `FIRST_RULE_ID` — [Rules](https://developers.meethue.com/documentation/rules-api#61_get_all_rules).  
    Among your rules, look for the one having `"name": "Dimmer Switch X on0"`. This rule will exist, provided you already set up your Hue Dimmer switch using the app. The script will update 12 consecutive rules beginning with this rule.
3. Run the script:
    ```bash
    $ ./hue-multidim-setup.sh
    ```
