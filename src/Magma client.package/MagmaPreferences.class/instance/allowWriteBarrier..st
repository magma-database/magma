accessing
allowWriteBarrier: aBoolean 
	"Specify whether WriteBarrier should be used.  WriteBarrier uses Smalltalk 'magic' to change the class of each materialized domain to a specialized subclass that overrides mutating methods to call super, then signal a changed flag if the object changed.  As with all magic, this should be used with caution."
	aBoolean ifTrue:
		[ self class canEnableWriteBarrier ifFalse: [ self class signalCannotEnableWriteBarrier ] ].
	attributes
		at: #allowWriteBarrier
		put: aBoolean