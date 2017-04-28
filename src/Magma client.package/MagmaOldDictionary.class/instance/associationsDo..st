enumerating
associationsDo: aBlock 
	"Evaluate aBlock for each of the receiver's elements (key/value associations)."
	self 
		slowlyDo: aBlock
		pageBoundariesDo: [  ]