firstname_dict = {
"lee":"李",
"zhao":"赵",
"tan":"谭",
"sun":"孙",
"li":"李",
"qian":"钱",
"zhou":"周",
"wu":"吴",
"zheng":"郑",
"wang":"王"
}

import random

firstnames = list(firstname_dict.keys())

while True:
	firstname = random.choice(firstnames)
	cnfirstname = firstname_dict[firstname]
	firstname_guess = input("What is the chinese character of " + firstname + "?")

	if firstname_guess == 'quit':
		break
	elif firstname_guess == cnfirstname:
		print("Correct! Nice job!")
	else:
		print("Incorrect. The chinese character of " + firstname + " is " + cnfirstname + ".")

print("All done.")
