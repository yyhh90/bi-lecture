num = list(map(int, input().split()))
sum = 0
for i in num:
    sum += i**2

six_num = sum % 10
print(six_num)
