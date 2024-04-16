L = list()
for i in range(9):
    n = int(input())
    L.append(n)

max_n = max(L)
print(max_n)
print(L.index(max_n) + 1) 
