as yet unclassified
systemChanged: anEvent
	builders keysAndValuesDo:
		[:class :builder |
		(class withAllSuperclasses includes: anEvent itemClass) ifTrue:
			[builder systemChanged: anEvent]]