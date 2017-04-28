access
referencedBuffers
	^ buffer isPointers ifTrue:
		[ (1 to: buffer objectInstSize) collect:
			[ : index | self bufferAt: (buffer maInstVarAt: index) ] ]