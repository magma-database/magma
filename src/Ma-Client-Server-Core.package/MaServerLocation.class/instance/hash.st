testing
hash
	"Local addresses may be anything that begins with 127."
	^ self hostAddress 
		ifNil: [ nil hash bitXor: port hash ]
		ifNotNil: 
			[ : addr | 
			| simplifiedAddress |
			simplifiedAddress := addr maIsLocalHost 
				ifTrue: [ #(127 0 0 1 ) asByteArray ]
				ifFalse: [ addr ].
			simplifiedAddress hash bitXor: port hash ]