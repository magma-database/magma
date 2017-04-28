*ma-core
maPrint: anObject pluralizeIf: aBlock 
	anObject maPrintOn: self.
	aBlock value ifTrue:
		[ self maPrint:
			(self last asLowercase = $s
				ifTrue: [ $' ]
				ifFalse: [ $s ]) ]