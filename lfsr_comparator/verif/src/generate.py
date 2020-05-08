import random

random.seed(1234)

def gcd(a, b):
    while a != b:
        if a > b:
            a = a - b
        else:
            b = b - a
    return a

n = 1024
f_in = open('./data/input.txt', 'w')
f_out = open('./data/output_gold.txt', 'w')
for i in range(n):
    op_a = random.randint(1, 255)
    op_b = random.randint(1, 255)
    res_gold = gcd(op_a, op_b)
    f_in.write('{0:08b}'.format(op_a) + '{0:08b}'.format(op_b) + '\n')
    f_out.write('{0:08b}'.format(res_gold) + '\n')
f_in.close()
f_out.close()
