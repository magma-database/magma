testing
isKnownAs: className

	^ self name = className
	or: [ aliases includes: className ]