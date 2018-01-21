private non-collection samples
methodReferenceSamples
	^ {(self class compiledMethodAt: thisContext selector) maMethodReference.
	(MaSingleton class compiledMethodAt: #current) maMethodReference }