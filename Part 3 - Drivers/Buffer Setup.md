# Buffer Setup

## Here is just pure mess. I've made a script, in the end...

```bash
cd && \
mkdir configfs && \
mount -t configfs none configfs && \
mkdir configfs/iio/triggers/hrtimer/tmr0
cat trigger0/name > iio:device0/trigger/current_trigger && \
echo 1 > iio:device0/scan_elements/in_voltage0_en && \
echo 1 > iio:device0/scan_elements/in_voltage1_en && \
echo 1 > iio:device0/scan_elements/in_voltage2_en && \
echo 1 > iio:device0/scan_elements/in_voltage3_en && \
echo 1 > iio:device0/scan_elements/in_voltage4_en && \
echo 1 > iio:device0/scan_elements/in_voltage5_en && \
echo 10000 > trigger0/sampling_frequency  && \
echo 1 > iio:device0/buffer/enable

cd /sys/bus/iio/devices
cat trigger0/name > iio:device0/trigger/current_trigger

echo 0 > iio:device0/buffer/enable
echo 1 > iio:device0/scan_elements/in_voltage0_en
echo 1 > iio:device0/scan_elements/in_voltage1_en
echo 1 > trigger0/sampling_frequency
echo 1 > iio:device0/buffer/enable

mount -t configfs none configfs && \
mkdir configfs/iio/triggers/hrtimer/tmr0
cat trigger0/name > iio:device1/trigger/current_trigger && \
echo 10000 > trigger0/sampling_frequency


mount -t configfs none configfs && \
mkdir configfs/iio/triggers/hrtimer/tmr0

cd /sys/bus/iio/devices

cat trigger0/name > iio:device1/trigger/current_trigger && \
echo 10000 > trigger0/sampling_frequency

echo 1 > iio:device1/scan_elements/in_voltage0_en && \
echo 1 > iio:device1/scan_elements/in_voltage1_en && \
echo 1 > iio:device1/scan_elements/in_voltage2_en && \
echo 1 > iio:device1/scan_elements/in_voltage3_en && \
echo 1 > iio:device1/scan_elements/in_voltage4_en && \
echo 1 > iio:device1/scan_elements/in_voltage5_en && \
echo 1 > iio:device1/buffer/enable
```
