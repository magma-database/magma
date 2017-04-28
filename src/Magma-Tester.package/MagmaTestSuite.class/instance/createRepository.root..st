setup-teardown
createRepository: aString root: anObject 
	[ MagmaRepositoryController
		delete: aString ;
		create: aString
			root: anObject ] 
		on: MagmaDeleteWarning
		do: [ : warning | warning resume ]