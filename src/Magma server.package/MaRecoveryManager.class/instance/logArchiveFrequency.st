accessing
logArchiveFrequency
	^ logArchiveFrequency ifNil: [ logArchiveFrequency := 5 minutes asMilliSeconds ]