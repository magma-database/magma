initialize-release
key: aKey value: aValue next: aNext finList: aList

	key := aKey.
	self basicAt: 1 put: aValue.
	finList := aList.
	next := aNext