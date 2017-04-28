floats
isOidForFloat: oidInteger

	^ oidInteger
		between: self oidForSmallestFloat
		and: 281472828227007  "self oidForSmallestOptimizedInteger - 1"