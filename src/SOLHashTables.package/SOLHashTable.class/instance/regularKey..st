private
regularKey: frwdKey 
	28 = keyBits ifTrue: [ ^ self class regularKey29: frwdKey ].
	31 = keyBits ifTrue: [ ^ self class regularKey32: frwdKey ].
	^ self class
		regularKey: frwdKey
		bits: keyBits + 1