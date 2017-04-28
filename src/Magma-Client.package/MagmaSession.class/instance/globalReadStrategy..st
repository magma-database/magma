performance
globalReadStrategy: aMaReadStrategy 
	"Set my ReadStrategy, as well as all other sessions of sessions I link to."
	self
		setGlobalReadStrategy: aMaReadStrategy
		ifNotIn: Set new