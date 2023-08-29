# ADXL327 Tests

We have done some measurements to make sure that everything is wired correctly. This also helped us decide what is the middle value for each axis (even though they are all the same). We didn't use the values from the datasheet because they used a 3V power supply and we used 3.3V, so the values are a tiny bit different.

## Measurements

### X Axis (board pin 12)

```json
   min: 1.165
offset: 1.611
   max: 2.058
```

### Y Axis (board pin 10)

```json
   min: 1.16
offset: 1.66
   max: 2.088
```

### Z Axis (board pin 8)

```json
   min: 1.159
offset: 1.839
   max: 2.078
```

## Normalized Values

All axes will be normalized to the same range, therefore:

```json
   min: 1.1
offset: 1.6
   max: 2.1
```

## Conclusion

This way, the middle value is `1.6` and the range is `0.5`. Using **op-amps**, we will split the range into 2 parts, one for the **negative** and one for the **positive** values. Moreover, we will use a gain of `5`, so the range will be `0 - 2.5V`. Great! The values are in the range of the ADC, so each of the 6 channels will be able to read the values with a **greater precision** than if we used only 3 channels.
