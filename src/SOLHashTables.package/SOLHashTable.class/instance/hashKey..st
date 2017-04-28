private
hashKey: rvrsKey 
	28 = keyBits ifTrue: [ ^ self class hashKey29: rvrsKey ].
	31 = keyBits ifTrue: [ ^ self class hashKey32: rvrsKey ].
	^ self class
		hashKey: rvrsKey
		bits: keyBits+1