code1 = input()
N = int(input())

count = 0
for i in range(N):
    code2 = input()
    if code1[0:5] == code2[0:5]:
        count += 1

print(count)
