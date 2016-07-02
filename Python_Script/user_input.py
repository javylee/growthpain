print("Hello human!")
while True:
	user_input = input("> ")
	if user_input == "quit":
		print("Goodbye human!")
		break
	else:
		#print("You just said: " + str(user_input))
		print(user_input)
		print(type(user_input))
