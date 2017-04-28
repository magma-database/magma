recovery
primitiveRecover
	"This is needed in very rare, dire circumstances where the server was actually writing its own system-definition when an outage occurred.  In that case the repository will not even be able to open normally to get to the normal recovery.  That condition is trapped for any Error and sent here to try opening all files in the directory and then doing a normal unapply (rollback).  Theoretically, that should work."

	filer ensureFilesOpen.
	recoveryManager primitiveRecoverUsing: self