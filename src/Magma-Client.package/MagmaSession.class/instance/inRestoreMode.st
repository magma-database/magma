high-availability
inRestoreMode
	"Answer whether the primary server is in restoreMode."
	self ensureIsAdminSession.
	^ self remotePrimitiveAttributes at: #restoreMode