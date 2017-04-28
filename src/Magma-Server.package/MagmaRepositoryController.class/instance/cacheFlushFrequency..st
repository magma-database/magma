preferences
cacheFlushFrequency: numberOfSeconds 
	^ self requestCritical: [ preferences cacheFlushFrequency: numberOfSeconds ]