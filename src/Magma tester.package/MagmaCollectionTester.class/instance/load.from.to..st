private-querys tests
load: aCollection from: startIndex to: endIndex
	startIndex to: endIndex do:
		[ : x |
		aCollection add: (samples at: x) ]