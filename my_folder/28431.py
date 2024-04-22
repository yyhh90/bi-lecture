a = []
for i in range(5):
    num = int(input())
    if num in a:
        a.remove(num)
    else:
        a.append(num)

print(a[0])
