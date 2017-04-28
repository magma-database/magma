accessing
clientConnection
	^ self lifecycle ifNotNilDo: [ : lc | lc clientConnection ]