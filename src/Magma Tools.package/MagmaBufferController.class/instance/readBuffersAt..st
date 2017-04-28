private
readBuffersAt: oidInteger 
	| requestedBuffers |
	requestedBuffers := session rawBuffersFor: oidInteger.
	requestedBuffers do: 
		[ : each | 
		bufferFacades 
			at: each oid
			put: (MagmaBufferFacade 
					buffer: each
					controller: self) ].
	^ bufferFacades at: oidInteger