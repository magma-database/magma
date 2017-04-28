testing
= aMagmaRemoteLocation 
	aMagmaRemoteLocation maOriginalClass = self maOriginalClass ifFalse: [ ^ false ].
	^ self serverLocation = aMagmaRemoteLocation serverLocation