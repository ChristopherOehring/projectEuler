import numpy as np
x_len = 20
y_len = 20

x_len += 2
y_len += 2
m = np.zeros((x_len, y_len), np.uint64)
m[1,0] = 1

for y in range(1, y_len):
    for x in range(1, x_len):
        m[x, y] = m[x-1, y] + m[x, y-1]

print(m)
