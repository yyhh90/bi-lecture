n = input()

n_ans = ["a", "e", "i", "o", "u"]
y_ans = ["a", "e", "i", "o", "u", "y"]
no_count = 0
yes_count = 0
for i in n_ans:
    if i in n:
        no_count += 1

for i in y_ans:
    if i in n:
        yes_count += 1

print(f"{no_count} {yes_count}")
