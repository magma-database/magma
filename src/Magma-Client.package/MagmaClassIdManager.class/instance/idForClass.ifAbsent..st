accessing
idForClass: aClass ifAbsent: aBlock 
	^ aClass = MagmaCounter 
		ifTrue: [ self class magmaCounterClassId ]
		ifFalse: 
			[ super 
				idForClass: aClass
				ifAbsent: aBlock ]