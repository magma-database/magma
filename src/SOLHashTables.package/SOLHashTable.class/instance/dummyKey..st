private
dummyKey: frwdKey 
	28 = keyBits ifTrue: [ ^ self class dummyKey29: frwdKey ].
	31 = keyBits ifTrue: [ ^ self class dummyKey32: frwdKey ].
	^ self class
		dummyKey: frwdKey
		bits: keyBits+1