private accessing
indexValues

	^ (self index
		upTo: sortedKeys size
		keysAndValuesFrom: self index lowestPossibleKey
		to: self index highestPossibleKey
		startingAt: 1) last copy