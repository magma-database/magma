private
bitReverse: anUnsignedInt 
	^ keyBits = 28
		ifTrue: [ self class bitReverse29: anUnsignedInt ]
		ifFalse:
			[ keyBits = 31
				ifTrue: [ self class bitReverse32: anUnsignedInt ]
				ifFalse: [ anUnsignedInt bitReverse: keyBits + 1 ] ]