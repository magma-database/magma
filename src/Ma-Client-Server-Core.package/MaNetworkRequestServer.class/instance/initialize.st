private
initialize
	super initialize.
	socket := MaServerSocket new
		 doBlock: [ : eachRequest | self processRequestByteArray: eachRequest ] ;
		 yourself.
	nextId := 1.
	self initializeSerializer