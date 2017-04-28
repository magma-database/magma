private
sizeOfKeySizeForVersion: anInteger 
	^ anInteger = 1 
		ifTrue: [ 8 ]
		ifFalse: [ 16 ]