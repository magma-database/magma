*ma-core
printDetailsOn: aStream 
	| sender |
	sender := self signalerContext sender receiver.
	((sender respondsTo: #magmaOid) and: [ sender isSymbol not ]) ifTrue:
		[ aStream
			 nextPutAll: 'magmaOid:  ' , sender magmaOid asString ;
			 cr ]