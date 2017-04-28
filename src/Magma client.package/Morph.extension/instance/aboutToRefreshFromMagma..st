*magma client
aboutToRefreshFromMagma: aMagmaRefreshEvent

	| restoreData |
	self isInWorld ifFalse: [ "no need"  ^ self ].
	self isWorldMorph ifTrue: [ "not supported"  ^ self ].
	"capture position and index, then delete so it can be updated 'offline'."
	restoreData := Dictionary new.
	restoreData
		at: #owner put: owner ;
		at: #index put: (owner submorphs indexOf: self) ;
		at: #wasStepping put: (self isWorldMorph or: [ self isStepping ]).
	aMagmaRefreshEvent restoreData: restoreData.
	self delete