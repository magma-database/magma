accessing
size
	"Answer how many elements the receiver contains."
	^ collections
		inject: 0
		into:
			[ : sum : each | sum +
				(each isCollection
					ifTrue: [ each size ]
					ifFalse: [ 1 ]) ]