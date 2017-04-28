*ma-core
maPermutationsSize
	"Assume I am an Array of Array's that will be permuted via maPermuationsDo:.  Progress-indication is useful in this situation."
	^ self
		inject: 1
		into:
			[ : prod : each | prod * (each size max: 1) ]