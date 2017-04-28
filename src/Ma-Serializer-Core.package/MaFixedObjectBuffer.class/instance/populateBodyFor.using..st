building
populateBodyFor: storageObject using: aMaObjectSerializer
	1
		to: storageObject maInstSize
		do:
			[ :index |
			self
				maInstVarAt: index
				put:
					((storageObject maIsTransient: index)
						ifTrue: [ OidForNil ]
						ifFalse: [ aMaObjectSerializer oidFor: (storageObject slotAt: index) ]) ]