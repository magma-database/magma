results access
remove: resultObject from: aMaContextResultsContext 
	"Remove resultObject from the list."
	results ifNil: [ ^ self ].
	self results 
		remove: resultObject
		from: aMaContextResultsContext