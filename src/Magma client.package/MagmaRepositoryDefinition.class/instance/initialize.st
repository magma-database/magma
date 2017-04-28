initialize
initialize
	super initialize.
	self classDefinitions: Dictionary new.
	codeBase := MagmaRepositoryCodeBase new.
	self initializeMagmaId.
	maximumNumberOfChallengers := 1000.
	attributes := Dictionary new.
	links := Set new