*ma-serializer-core
maSerializationClass
	^ self > 1073741823
		ifTrue: [ LargePositiveInteger ]
		ifFalse:
			[ self < -1073741824
				ifTrue: [ LargeNegativeInteger ]
				ifFalse: [ SmallInteger ] ]