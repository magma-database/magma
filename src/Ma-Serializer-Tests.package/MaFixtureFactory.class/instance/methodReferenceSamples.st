rm
methodReferenceSamples
	^ {(self class compiledMethodAt: thisContext selector) methodReference.
	(MaSingleton class compiledMethodAt: #current) methodReference }