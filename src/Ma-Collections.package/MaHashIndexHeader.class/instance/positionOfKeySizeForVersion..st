private
positionOfKeySizeForVersion: anInteger 
	^ anInteger = 1 
		ifTrue: [ 0 ]
		ifFalse: [ 2 ]