as yet unclassified
initializeFrom: aMacsTestRequest 
	response1 := DateAndTime 
		date: (aMacsTestRequest object1 asDate addDays: 1)
		time: aMacsTestRequest object1 asTime.
	response2 := aMacsTestRequest object2 value -> aMacsTestRequest object2 key