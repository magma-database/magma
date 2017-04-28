accessing
idForClass: aClass ifAbsent: aBlock 
	| index |
	aClass isMeta ifTrue: 
		[ MaObjectSerializationSoftwareError signal: 'Metaclass instances are not stored here.' ].
	^ idsByClass 
		at: aClass
		ifAbsent: 
			[ (index := minimumClasses indexOf: aClass) > 0 
				ifTrue: [ index ]
				ifFalse: [ aBlock value ] ]