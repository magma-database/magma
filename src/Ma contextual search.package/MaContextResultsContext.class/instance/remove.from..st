accessing
remove: resultObject from: aMaContextResultsContext 
	"Remove resultObject from the list."
	self == aMaContextResultsContext 
		ifTrue: 
			[ resultsByRelevance do: 
				[ : each | 
				(each includes: resultObject) ifTrue: 
					[ each 
						remove: resultObject
						ifAbsent: 
							[ "no need to signal an error"
							 ] ] ].
			self changed ]
		ifFalse: 
			[ results 
				remove: resultObject
				from: aMaContextResultsContext ]