
def alphabetical_value(name):
    name.upper()
    res = 0
    for char in name:
        res += ord(char) - 64
    return res

f = open('input\p022_names.txt')
lines = f.readlines()
names = lines[0].replace('"','').split(',')

names.sort()
scores_total = 0
for i, name in enumerate(names, 1):
    scores_total += i * alphabetical_value(name)
print(scores_total)