enumerating
pathFrom: anObject do: aBlock 
	"Value aBlock with the objects from anObject to its highest level parent."
	self 
		pathFrom: anObject
		to: nil
		do: aBlock