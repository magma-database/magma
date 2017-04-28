test local sessions
testLocallyConnectedSessions
	"Test whether #advanceUsing: can withstand new class-definitions."
	| dbName |
	dbName := self localDbName.
	
	[ MagmaRepositoryController
		delete: dbName ;
		create: dbName
			root: Dictionary new ] 
		on: MagmaDeleteWarning
		do: [ : warn | warn resume ].
	self
		runTestAdvanceIntoNewClassDefinitions ;
		runLocalSessionsConcurrencyDetection