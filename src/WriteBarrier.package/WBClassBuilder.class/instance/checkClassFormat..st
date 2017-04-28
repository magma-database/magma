private
checkClassFormat: anEvent
	((class format ~~ class superclass format) or: [anEvent areInstVarsModified]) ifTrue:
		[self migrateFromTarget: anEvent oldItem to: anEvent itemClass]