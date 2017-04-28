*magma server
nodeCheck
	"If I am a read-request sent to a primary, or a commit-request sent to a secondary, it's a red-flag to check on node-availability.  Check the node it *should* be going to.  If it is truly unavailable then update my MagmaNode accordingly and then #ensureCorrectNodeConfiguration.  If it is still available, then perhaps it is a client-issue, signal a MagmaWrongServerError to cause the client to reset its own configuration."

	"Optional subclass override."
	