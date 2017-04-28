capture context
writeVmInformationTo: aStream

	aStream
		cr; cr;
		nextPutAll: 'Vm Details:'.
	#(vmVersion)
		do:
			[ : each | 
			self
				writeEntry: each
				value: (SmalltalkImage current perform: each)
				to: aStream ]