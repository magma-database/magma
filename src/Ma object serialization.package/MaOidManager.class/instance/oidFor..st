accessing
oidFor: anObject 
	^ self
		oidFor: anObject
		ifAbsent:
			[ self
				oidOf: anObject realObjectIfMutatingProxy
				is: self getNextOid ]