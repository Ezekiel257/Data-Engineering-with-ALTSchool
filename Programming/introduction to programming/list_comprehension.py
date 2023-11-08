
"""
odd_list = []

for i in range(100):
    if not i % 2 == 0:
        odd_list.append(i)

print(odd_list)
"""

odd_list_2 = [i for i in range(100) if i % 2 != 0]
print(odd_list_2)