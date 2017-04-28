private comparing
getCompareObjectFor: anObject
	"If using the accessSelector feature, compare based on that, otherwise on anObject."
	^ accessSelector
		ifNil: [ anObject ]
		ifNotNil:
			[ (anObject respondsTo: accessSelector)
				ifTrue: [ anObject perform: accessSelector ]
				ifFalse: [ anObject ] ]