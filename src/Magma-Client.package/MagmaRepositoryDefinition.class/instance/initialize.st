initialize
initialize
	super initialize.
	self classDefinitions: Dictionary new.
	codeBase := MagmaRepositoryCodeBase new.
	self initializeMagmaId.
	maximumNumberOfChallengers := 1000.
	links := Set new.
	symbols := Set new.
	locked := false