accessing
treeAt: anObject 
	"Return a new instance of the receiver which has a single main parent anObject."
	^ self 
		treeAt: anObject
		ifAbsent: 
			[ self error: anObject printString , ' was not found in ' , self printString ]