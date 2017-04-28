enumerating (slow)
associationsDo: aBlock 
	"Value aBlock with each of my Associations."
	self
		slowlyDo: aBlock
		pageBoundariesDo: [  ]