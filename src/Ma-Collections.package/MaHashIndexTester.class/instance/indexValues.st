private accessing
indexValues

	^ (self index
		upTo: predictedSize*2
		keysAndValuesFrom: self index lowestPossibleKey
		to: self index highestPossibleKey
		startingAt: 1) last copy