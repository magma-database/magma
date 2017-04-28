initialize-release
resetNewObjects
	"This is needed because we only have 2 million new-object oids.  If we didn't do this, the nextOid counter continues to increase to its ceiling."

	self
		initializeNewObjects ;
		initializeNewOids ;
		resetNextOid
	