accessing
allowWriteBarrier: aBoolean 
	"Specify whether WriteBarrier should be used.  WriteBarrier changes the class of each materialized domain to a specialized subclass that overrides the mutating methods to call super, then signal a changed flag if the object changed."
	aBoolean ifTrue:
		[ self class canEnableWriteBarrier ifFalse: [ self class signalCannotEnableWriteBarrier ] ].
	self
		attributeNamed: #allowWriteBarrier
		put: aBoolean