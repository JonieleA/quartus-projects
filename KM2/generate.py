import random

f = open('rom128x8.txt', 'w')
random.seed()
for i in range(2**8):
    for j in range(8):
        f.write(str(random.randint(0,1)))
    f.write("\n")
f.close()