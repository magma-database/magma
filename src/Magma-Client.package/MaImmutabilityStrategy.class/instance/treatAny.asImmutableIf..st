setup
treatAny: aClass asImmutableIf: oneArgBlock 
	"Specify immutability of an object by its class and a condition on each instance of that class."
	aClass withAllSubclassesDo:
		[ : eachClass | classes
			at: eachClass
			put: oneArgBlock ]