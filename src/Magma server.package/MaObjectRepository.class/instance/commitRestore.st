high-availability
commitRestore
	"Do NOT use this unless you know what you are doing, use the public API only.  Set whether the receiver is operating in restoreMode.  Warm backups operate in restoreMode, taking commits broadcasted to them from the 'primary' and applying them."
	self restoreMode 
		ifTrue: 
			[ self
				restoreMode: false ;
				initializeBranchCode ]
		ifFalse: [ MagmaUserError signal: 'Not in restore mode!' ]