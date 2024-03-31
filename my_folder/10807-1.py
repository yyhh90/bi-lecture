cnt = 0
N = input()
N2 = input().split()
v = input()
for i in N2:
    if i == v:
        cnt += 1
print(cnt)
