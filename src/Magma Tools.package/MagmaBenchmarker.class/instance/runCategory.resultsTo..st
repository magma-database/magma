run
runCategory: selector resultsTo: aStream

	aStream
		cr; nextPutAll: '---';
		cr ;
		cr; nextPutAll: selector.
	(self perform: selector) do:
		[ : each |
		self
			run: each
			resultsTo: aStream ]