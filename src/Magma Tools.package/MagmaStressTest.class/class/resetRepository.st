initialize
resetRepository
	
	[ self
		deleteRepository ;
		createRepository ] 
		on: MagmaDeleteWarning
		do: [ : warn | warn resume ]