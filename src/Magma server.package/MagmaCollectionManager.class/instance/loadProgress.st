accessing
loadProgress
	^ loadExecutor 
		ifNil: 
			[ Fraction 
				numerator:
					(self isLoading 
						ifTrue: [ 0 ]
						ifFalse: [ 1 ])
				denominator: 1 ]
		ifNotNil: [ loadExecutor fractionComplete ]