private
ensureCorrectNodeConfiguration
	"Ensure I am performing the duty my MagmaNode says I should be performing, either as the primary or one of the warmBackups.  I am read-only on the node, I do not modify it.  The intended usage of this method is, you update the node to what you want it to be, then I 'make it so'."
	self isPrimary 
		ifTrue: 
			[ "To be extra conservative, configure all other nodes to restoreMode (before coming out of restoreMode myself)."
			self sessionsForOtherLocationsDo: 
				[ : each | 
				"Warning:  this is a sync request, no secondary should cause this method to be called on the primary.  Perhaps it should be async?"
				each ensureInRestoreMode ].
			self restoreMode ifTrue: 
				[ "I need to become the primary, make it so."
				controller commitRestore ].	"Now the others can become warm backups."
			self sessionsForOtherLocationsDo: [ : each | each ensureCorrectNodeConfiguration ] ]
		ifFalse: 
			[ self node primaryLocation ifNotNilDo: [ : pl | pl isLocal ifFalse: [ self beWarmBackupFor: pl ] ] ]