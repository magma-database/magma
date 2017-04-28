high-availability
beginRestore
	"Set my restoreMode bit, indicating I can only receive commitLogRecords in order from the primary.  This should only be done in conjunction with a corresponding change in the Node."
	self restoreMode 
		ifTrue: [ MagmaUserError signal: 'Already in restoreMode' ]
		ifFalse: [ self restoreMode: true ]