*magma server
seedDirectory
	"The initial copy of the repository, to which commit.n.log files may be loaded to advance it forward."
	^ FileDirectory on: (self directory fullNameFor: 'seed')