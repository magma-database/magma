accessing
initialize
	super initialize.
	object1 := DateAndTime 
		date: 
			(Date 
				newDay: (1 to: 365) atRandom
				year: (1900 to: 2100) atRandom)
		time: Time now.
	object2 := UUID new -> (1 to: 100000) atRandom asWords