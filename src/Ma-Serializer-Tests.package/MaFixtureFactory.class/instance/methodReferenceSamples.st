private non-collection samples
methodReferenceSamples
	^ {(self class compiledMethodAt: thisContext selector) methodReference.
	(MaSingleton class compiledMethodAt: #current) methodReference }