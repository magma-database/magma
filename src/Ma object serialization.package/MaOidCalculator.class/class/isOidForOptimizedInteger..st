integers
isOidForOptimizedInteger: oidInteger

	^ oidInteger
		between: 281472829227008  "self oidForZero + SmallInteger minVal"
		and: 281474976710655  "self oidForZero + SmallInteger maxVal"