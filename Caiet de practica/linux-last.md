# Linux Drivers - Days 5, 6 and 7

## Day 5

Today, we implemented functions which would read and write to and from the device. These were the most important functions, as they are the ones which will be used the most. These functions will pe used by the user to read and write to the device. Here they are:

```c
static int ad5592r_s_read_raw(struct iio_dev *indio_dev,
                              struct iio_chan_spec const *chan,
                              int *val,
                              int *val2,
                              long mask)
{
	struct ad5592r_s_state *st = iio_priv(indio_dev);
	int ret;

	switch (mask)
	{
	case IIO_CHAN_INFO_RAW:
		ret = ad5592r_s_spi_read_adc(st, chan->channel, val);
		if (ret) {
			dev_err(&st->spi->dev, "Failed reading from chan: %d\n", chan->channel);
			return ret;
		}
		return IIO_VAL_INT;

	case IIO_CHAN_INFO_ENABLE:
		*val = st->en;
		return IIO_VAL_INT;

	default:
		return -EINVAL;
	}
}

static int ad5592r_s_write_raw(struct iio_dev *indio_dev,
                               struct iio_chan_spec const *chan,
                               int val,
                               int val2,
                               long mask)
{
	struct ad5592r_s_state *st = iio_priv(indio_dev);
	switch (mask)
	{
	case IIO_CHAN_INFO_ENABLE:
		st->en = val;
		return 0;

	default:
		return -EINVAL;
	}
}
```

## Day 6

Now, we added debugfs support. This is a very useful feature, as it allows us to see the values of the registers and the values of the channels. Moreover, we can also change the values of the registers and the channels.

We also did some testing and debugging, and we found out some bugs that we're gonna fix tomorrow.

## Day 7

As previously mentioned, the day started with fixing some issues. Then, we started reading and understanding the datasheet of the convertor better, so that we can implement the rest of the functions. We also started implementing the functions for the rest of the channels + testing and debugging.
