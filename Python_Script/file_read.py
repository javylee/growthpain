f = open("scores.txt", "r")

list = []

for line in f:
	list.append(line)

print(list)

f.close()
