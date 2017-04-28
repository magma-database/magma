classes
selectClassesImplementing: selectorSymbol 
	self selectMethods: [ : each | each actualClass includesSelector: selectorSymbol ]