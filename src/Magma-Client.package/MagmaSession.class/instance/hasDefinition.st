testing
hasDefinition
	"Answer whether this MagmaSession instance has ever been connected to a repository.  Once connected to a particular repository, a MagmaSession may only reconnect to that repository, not to any other repository.  A new MagmaSession instance must be used to connect to a different repository."
	^ definition notNil