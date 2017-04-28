mouse cursor
writeCursor
	^ ShowStatusViaCursor 
		ifTrue: [ Cursor write ]
		ifFalse: [ self ]