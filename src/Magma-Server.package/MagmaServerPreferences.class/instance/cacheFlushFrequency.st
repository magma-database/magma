recovery
cacheFlushFrequency

	^ self
		valueOfAttribute: #cacheFlushFrequency
		ifAbsent: [ 5 "seconds" ]