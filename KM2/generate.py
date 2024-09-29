import random

f = open('rom128x8.txt', 'w')
random.seed()
for i in range(128):
    f.write("8'd"+str(random.randint(1,128))+"\n")
f.close()