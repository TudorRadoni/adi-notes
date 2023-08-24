# script to generate this output:
# ![[<month-day>]]\n
# for months 07 and 08, all days

import datetime

# start date
start_date = datetime.date(2020, 7, 1)
# end date
end_date = datetime.date(2020, 8, 31)

# get all dates between start and end date
delta = datetime.timedelta(days=1)
while start_date <= end_date:
    # print date in format [[<month-day>]]
    print("![[" + start_date.strftime("%m-%d") + "]]")
    start_date += delta
