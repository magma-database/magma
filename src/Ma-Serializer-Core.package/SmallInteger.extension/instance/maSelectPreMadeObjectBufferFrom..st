*ma-serializer-core
maSelectPreMadeObjectBufferFrom: aMaObjectSerializer 
	^ (self
		between: -1073741824
		and: 1073741823)
		ifTrue: [ aMaObjectSerializer preMadeFixedObjectBuffer ]
		ifFalse: [ "For backward compatibility with legacy Magma from 64-bit images."
			aMaObjectSerializer preMadeByteObjectBuffer ]