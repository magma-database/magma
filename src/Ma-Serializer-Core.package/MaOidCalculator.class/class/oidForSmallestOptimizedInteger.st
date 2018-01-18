integers
oidForSmallestOptimizedInteger
	"Hard-code to avoid potential problems when moving to 64-bit Squeak."
	^ self oidForInteger: -1073741824 "SmallInteger minVal"