*ma-serializer-core
wordAt: index put: value
	^ self slotAt: index put: (Float fromIEEE32Bit: value)