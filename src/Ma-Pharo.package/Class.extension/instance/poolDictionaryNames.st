*ma-pharo
poolDictionaryNames
	^ self sharedPools
		collect: [ :ea | self environment keyAtIdentityValue: ea ifAbsent: [ ea name ] ]