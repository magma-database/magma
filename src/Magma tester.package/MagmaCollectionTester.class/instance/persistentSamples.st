private-samples
persistentSamples
	^ (1 to: 100) collect: [ : n | self sampleAt: n ]