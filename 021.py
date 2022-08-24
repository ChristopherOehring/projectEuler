

from math import ceil, sqrt


def d(n):
    #Liste aller Teiler
    teiler = [1, ]
    wurzel = sqrt(n)
    for i in range(2, ceil(wurzel)):
        if n % i == 0:
            teiler.append(i)
            teiler.append(n/i)
        if wurzel % 1 == 0:
            teiler.append(wurzel)
    return sum(teiler)

sum_amicable_numbers = 0
for a in range(10000):
    b = d(a)
    if a != b and d(b) == a:
        print(a,b)
        sum_amicable_numbers += a

print(sum_amicable_numbers)