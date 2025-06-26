
	' THE MONTY HALL PROBLEM: A Simulation
	' by Rick Adams

	' Init display
	width 80
	palette 0, 0  	' black background
	palette 8, 22	' green text

	' Randomize the RND function
	r = rnd(-timer)

	' Reset machine on BREAK
	on brk goto 3000

	' User input
10	print "Monty Hall problem"
	print
	print "Are we going to switch (Y/N)";
	input a$
	print
	print "How many repetitions";
	input n

	' Let's play the game repeatedly
	for i = 1 to n
		gosub 1000
	next i

	' Grand total
	print
	print "Wins:"; w
	print "Losses:"; l
	print
	goto 10

	' Load up the doors with goats
1000	d$(1) = "G"
	d$(2) = "G"
	d$(3) = "G"

	' Put a car behind a random door
	d$(int(3 * rnd(0)) + 1) = "C"

	' Your guess
	print
	g = int(3 * rnd(0)) + 1
	print "You guess door #"; g

	' Monty always opens another door
	' Door has to have a goat behind it and not be the one you picked
1020	d = int(3 * rnd(0)) + 1
	if d$(d) = "C" or d = g then
		goto 1020
	end if

	' How about it, pal?
	print "Monty opens door #"; d; "to reveal a goat."

	' Do we switch?
	if a$ = "Y" then

		' Let's switch!
		gosub 2000
		print "You decide to switch to door #"; f

	else

		' Let's stick with our original guess
		f = g
		print "You stick with door #"; f

	end if
	
	' How'd that work out for you?
	if d$(f) = "C" then
		print "Beep beep! You win! It's a car!"
		w = w + 1
	else
		print "Too baaaaad! It's a goat!"
		l = l + 1
	end if

	return

	' Let's switch!
2000	for j = 1 to 3
		if j <> g and j <> d then
			f = j
		end if
	next j
	return

	' Reset the machine
3000	poke &h71, 0
	exec &h8c1b
