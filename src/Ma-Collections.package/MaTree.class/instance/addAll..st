building
addAll: aCollection 
	"Adds all in aCollection as main parents in the receiver."
	aCollection do: [ : each | self add: each ]