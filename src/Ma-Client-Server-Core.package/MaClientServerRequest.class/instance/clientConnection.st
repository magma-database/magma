accessing
clientConnection
	^ self lifecycle ifNotNil: [ : lc | lc clientConnection ]