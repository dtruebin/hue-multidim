## About
This project contains the script which uploads a set of rules to your Hue Bridge, allowing a _single_ Hue Dimmer switch to control _two groups of lights_ a.k.a. rooms, instead of default one group.

See the [wiki](https://github.com/dtruebin/hue-multidim/wiki) for additional information about the switch layout.

## Guide
1. Create config based on the sample:
    ```bash
    $ cp etc/hue-multidim.conf.sample hue-multidim.conf
    ```
2. Open hue-multidim.conf and set variable values. If you need help identifying the correct values, refer to the following pages of Hue API documentation:
    - `HUB_IP` and `API_KEY` — [Getting Started](https://www.developers.meethue.com/documentation/getting-started),
    - `OUTER_GROUP_ID` and `INNER_GROUP_ID` — [Groups](https://www.developers.meethue.com/documentation/groups-api#21_get_all_groups),
    - `DIMMER_SENSOR_ID` — [Sensors](https://www.developers.meethue.com/documentation/sensors-api#51_get_all_sensors). Among your sensors, look for the one having a type of `ZLLSwitch`.
3. Run the script:
    ```bash
    $ ./hue-multidim-setup.sh
    ```