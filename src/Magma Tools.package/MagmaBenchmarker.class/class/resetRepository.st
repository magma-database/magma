private
resetRepository
	[ MagmaRepositoryController delete: self benchName ] 
		on: MagmaDeleteWarning
		do: [ : warning | warning resume ].
	MagmaRepositoryController 
		create: self benchName
		root: Dictionary new