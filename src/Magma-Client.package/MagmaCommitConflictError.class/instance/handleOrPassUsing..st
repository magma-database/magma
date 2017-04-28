private
handleOrPassUsing: aMagmaSession 
	"We can handle a conflict on the repository-Definitions Set of 'symbols', simply add-in the ones again and retry."
	| conflictingObjects |
	(result commitConflicts size = 1 and:
		[ (conflictingObjects := result commitConflicts first conflictingObjects) size = 1 and: [ conflictingObjects first key == aMagmaSession definition symbols ] ])
		ifTrue:
			[ conflictingObjects first key addAll: conflictingObjects first value.
			 aMagmaSession begin.
			self retry ]
		ifFalse: [ self pass ]