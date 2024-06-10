c1, b1, p1 = list(map(int, input().split()))
c2, b2, p2 = list(map(int, input().split()))

n = 0

if c1 < c2:
    n += abs(c2 - c1)
if b1 < b2:
    n += abs(b2 - b1)
if p1 < p2:
    n += abs(p2 - p1)

print(n)
