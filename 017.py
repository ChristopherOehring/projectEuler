from num2words import num2words
import re

total = 0

for i in range(1,1001):
    str_num = num2words(i)
    total += len(re.sub(r"\s+|-+", "", str_num, flags=re.UNICODE))

print(total)
