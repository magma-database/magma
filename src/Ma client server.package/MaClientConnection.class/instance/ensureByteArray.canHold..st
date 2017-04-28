private
ensureByteArray: aByteArray canHold: anInteger 
	| newAnswer |
	^ aByteArray size < anInteger 
		ifTrue: 
			[ newAnswer := ByteArray new: anInteger.
			newAnswer 
				replaceFrom: 1
				to: aByteArray size
				with: aByteArray
				startingAt: 1.
			newAnswer ]
		ifFalse: [ aByteArray ]