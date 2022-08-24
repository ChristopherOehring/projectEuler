
biggest_i = 0
biggest_n = 1
for n in range(1, 1000001):
    i = 0
    n_1 = n
    while n != 1:
        if n % 2 == 0:
            n /= 2
        else:
            n = 3 * n + 1
        i += 1
    print(n_1, i)
    if i > biggest_i:
        biggest_i = i
        biggest_n = n_1

print(biggest_n)