private building
appendString: anObject

	anObject isString 
		ifTrue: [ stream nextPutAll: anObject ] 
		ifFalse: [ anObject printOn: stream ]