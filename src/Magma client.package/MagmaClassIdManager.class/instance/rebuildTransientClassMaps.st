special-case
rebuildTransientClassMaps
	| highestId |
	idsByClass := idsByClass maOriginalClass new: idsByClass size.
	classesById := classesById maOriginalClass new: classesById size.
	inImageDefinitions := inImageDefinitions maOriginalClass new: inImageDefinitions size.
	highestId := 0.
	classDefinitionsById keysAndValuesDo: 
		[ : eachId : eachDefinitions | 
		| eachClass |
		highestId := highestId max: eachId.
		eachDefinitions do: 
			[ : each | 
			each isDefined ifTrue: 
				[ eachClass := each classObject.
				self 
					idOfClass: eachClass
					is: eachId.
				self refreshInImageDefinition: eachClass ] ] ].
	nextClassId := highestId max: nextClassId