*magma-server
isPrimary
	"Answer whether I thisLocation is the primary server of a multi-server node.  If a single-server, answer false."
	^ self restoreMode not and: [ self node isBackedUp ]