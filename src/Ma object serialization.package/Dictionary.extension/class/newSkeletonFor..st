*ma object serialization
newSkeletonFor: aMaVariableObjectBuffer
	^ self new: aMaVariableObjectBuffer objectInstSize / 2 "key + value"