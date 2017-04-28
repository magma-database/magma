private
hashFor: anObject
	| hugeNumber validHash |
	validHash := 0.
	hugeNumber := anObject hash.
	[ hugeNumber > 0 ] whileTrue: 
		[ validHash := validHash bitXor: (hugeNumber bitAnd: (1 bitShift: table keyBits)-1).
		hugeNumber := hugeNumber bitShift: -28 ].
	^ validHash