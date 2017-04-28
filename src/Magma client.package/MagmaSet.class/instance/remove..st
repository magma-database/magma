add / remove
remove: anObject 
	^ (self equivalentOf: anObject) in: 
		[ : equivalent | 
		equivalent 
			ifNotNil: [ super remove: equivalent ]
			ifNil: 
				[ MagmaEquivalentObjectNotInCollection signal: anObject printString , ' is not in ' , self printString ] ]