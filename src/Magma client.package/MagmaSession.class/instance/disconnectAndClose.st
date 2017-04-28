connections
disconnectAndClose
	"Disconnect from the repository and, if it is a locally-connected one, close the repository."
	self disconnect.
	self isLocal ifTrue: [ self closeRepository ]