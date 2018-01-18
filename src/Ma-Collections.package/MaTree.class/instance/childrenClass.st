private
childrenClass
	^ (Smalltalk hasClassNamed: #MaDictionary) 
		ifTrue: [ Smalltalk classNamed: #MaDictionary ]
		ifFalse: [ Dictionary ]