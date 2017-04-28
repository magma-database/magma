access
referencedBuffers

	^ (1 to: buffer objectInstSize) collect:
		[ : index |
		self bufferAt: (buffer maInstVarAt: index) ]