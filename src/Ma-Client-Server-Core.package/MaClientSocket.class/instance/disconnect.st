private
disconnect
	stat release.
	socket ifNotNil: 
		[ socket closeAndDestroy: 5.
		socket := socketStream := nil ]