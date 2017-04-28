initialize-release
key: aKey value: aValue next: aNext
	key := aKey.
	self basicAt: 1 put: aValue.
	next := aNext