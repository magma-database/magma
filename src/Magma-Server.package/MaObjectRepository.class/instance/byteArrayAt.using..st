accessing
byteArrayAt: oidInteger using: aMaReadStrategy

	^ (MaOidCalculator isOidForUserObject: oidInteger)
		ifTrue:
			[ (self
				graphBufferAt: oidInteger
				using: aMaReadStrategy) trimmedByteArray ]
		ifFalse:
			[ "When could this happen?  (Sigh), when they put an atomic in a MagmaLargeCollection."
			(self session serializer serializeGraph:
				(MaOidCalculator
					objectWithOid: oidInteger
					ifNone: [ MagmaSoftwareError signal: 'unknown oid' ])) trimmedByteArray ]