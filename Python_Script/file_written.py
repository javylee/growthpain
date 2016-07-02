f = open("scores.txt", "w")

while True:
	participant = input("Participant Name > ")

	if participant == "quit":
		print("Quitting......")
		break

	score = input("Score for " + participant + "> ")
	f.write(participant + "," + score + "\n")

f.close()
