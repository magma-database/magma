capture context
writeClientSessionInformationTo: aStream

	aStream
		cr; cr;
		nextPutAll: 'MagmaSession Details:'.
	#(isLocal)
		do:
			[ : each | 
			self
				writeEntry: each
				value: (session perform: each)
				to: aStream ].
	#(allowWriteBarrier)
		do:
			[ : each | 
			self
				writeEntry: each
				value: (session preferences perform: each)
				to: aStream ]