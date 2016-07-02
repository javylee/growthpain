print("for loop......")
for i in [0,1,2,3,4]:
   print("Hello " + str(i))


print("while loop......")
counter = 0
while counter < 5:
	print("Hello " + str(counter))
	counter += 1


print("while True loop......")
counter = 0
while True:
	print("Hello " + str(counter))
	counter += 1

	if counter >= 5:
		break

