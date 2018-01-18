accessing
oidFor: anObject 
	^ self
		oidFor: anObject
		ifAbsent:
			[ self
				oidOf: anObject
				is: self getNextOid ]