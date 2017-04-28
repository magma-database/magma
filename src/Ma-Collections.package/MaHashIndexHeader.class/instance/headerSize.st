accessing
headerSize
	^ self version = 1 
		ifTrue: [ 3 ]
		ifFalse: [ 100 ]