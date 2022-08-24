x2 = 1
x3 = 1
sum_even = 0
while x3 < 4000000:
    if x3 % 2 == 0:
        sum_even += x3

    x1 = x2
    x2 = x3
    x3 = x1 + x2

print(sum_even)