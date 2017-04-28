private
positionOfRecordSizeForVersion: anInteger 
	^ anInteger = 1 
		ifTrue: [ 2 ]
		ifFalse: [ 6 ]