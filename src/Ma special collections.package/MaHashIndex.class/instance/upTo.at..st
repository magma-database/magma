accessing
upTo: countInteger at: keyInteger

	^ self
		upTo: countInteger
		keysAndValuesFrom: keyInteger
		to: keyInteger
		startingAt: 1