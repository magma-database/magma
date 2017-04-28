mouse cursor
readCursor
	^ ShowStatusViaCursor 
		ifTrue: [ Cursor read ]
		ifFalse: [ self ]