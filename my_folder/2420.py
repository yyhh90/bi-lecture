A, B = list(map(int, input().split()))
# map()함수 : int를 하나하나 씌움
# map 안 쓰고 하나씩 씌워도 되긴 함.
if A > B:
    print(A - B)
else:
    print(B - A)
