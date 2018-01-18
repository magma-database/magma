classes
rejectClassesImplementing: selectorSymbol 
	self rejectMethods: [ : each | each actualClass includesSelector: selectorSymbol ]