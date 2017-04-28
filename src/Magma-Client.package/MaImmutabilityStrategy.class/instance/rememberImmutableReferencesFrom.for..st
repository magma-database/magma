private
rememberImmutableReferencesFrom: anObject for: aMaTransaction 
	self
		
		rememberIfImmutableByClass: anObject
		for: aMaTransaction ;
		
		rememberImmutableReferencesFrom: anObject
		bySpecFor: aMaTransaction