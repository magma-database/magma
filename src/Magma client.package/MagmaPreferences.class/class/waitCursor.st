mouse cursor
waitCursor
	^ ShowStatusViaCursor 
		ifTrue: [ Cursor wait ]
		ifFalse: [ self ]