integers
isOidForOptimizedInteger: oidInteger
	^ oidInteger
		between: FirstSmallIntegerOid  "self oidForZero + SmallInteger minVal"
		and: LastSmallIntegerOid  "self oidForZero + SmallInteger maxVal"