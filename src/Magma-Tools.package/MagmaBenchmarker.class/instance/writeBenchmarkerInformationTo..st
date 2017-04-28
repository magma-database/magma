capture context
writeBenchmarkerInformationTo: aStream

	aStream
		cr; cr;
		nextPutAll: 'Benchmarker Details:'.
	#(thousands)
		do:
			[ : each | 
			self
				writeEntry: each
				value: (self perform: each)
				to: aStream ]