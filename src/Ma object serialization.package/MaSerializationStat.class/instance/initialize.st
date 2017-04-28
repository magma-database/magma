initialize-release
initialize
	super initialize.
	houseCleaningTimeHistory := MaStatHistory name: 'House Cleaning Times'.
	timeToMaterializeHistory := MaStatHistory name: 'Time Spent Materializing'.
	timeToSerializeHistory := MaStatHistory name: 'Time Spent Serializing'