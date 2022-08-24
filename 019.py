from calendar import weekday
import math
days_in_months_normal = [31,28,31,30,31,30,31,31,30,31,30,31]
days_in_months_leap = [31,29,31,30,31,30,31,31,30,31,30,31]

def is_leap(year):
    if year % 4 == 0:
        if year % 100 != 0 or year % 400 == 0:
            print(year, ' is a leapyear')
            return True
    return False

def is_sunday(days_since_1900_01_01):
    if days_since_1900_01_01 % 7 == 0:
        return True
    return False

days_since_1900_01_01 = 1+sum(days_in_months_normal) # including 1900.01.01
total_sunday_count = 0 
for year in range(1901,2001):
    curr_month = 0
    if is_leap(year):
        days_in_months = days_in_months_leap
    else:
        days_in_months = days_in_months_normal
    for month in days_in_months:

        curr_month += 1

        if is_sunday(days_since_1900_01_01):
            print(year, curr_month)
            total_sunday_count += 1 
        days_since_1900_01_01 += month
print(total_sunday_count)
