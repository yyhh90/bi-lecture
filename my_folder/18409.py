N = int(input())
s = input()
G = {"a", "e", "i", "o", "u"}
gather = 0
for i in s:
    if i in G:
        gather += 1

print(gather)
