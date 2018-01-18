creation
newPersonNames: anInteger 
	^ (1 to: anInteger) collect:
		[ : index | self firstNames at: index ]