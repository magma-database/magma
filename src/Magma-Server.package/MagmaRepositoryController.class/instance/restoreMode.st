backup / restore
restoreMode
	"Answer whether the receiver is operating in restoreMode.  Warm backups operate in restoreMode, taking commits broadcasted to them from the 'primary' and applying them."
	^ repository restoreMode