private
open
	"This is called when restarting controllers during image restart."
	| didRetry |
	didRetry := false.
	self potentiallyOpenByAnotherOsProcess ifTrue: [ MagmaPotentiallyOpenError signal: 'found ' , self class openIndicatorFilename , ' file, indicating this repository may currently be open.  If it is not, please delete the file and try again.' ].
	(FileDirectory on: self pathName) exists ifFalse: [ MagmaUserError signal: self pathName , ' not found.' ].
	[ self privateOpen: localLocation ]
		on: MagmaCorruptionError
		do:
			[ : err | didRetry
				ifTrue: [ err pass ]
				ifFalse:
					[ MagmaRollbackRecoveryNeeded signal: 'Outage occurred while writing system-definitions!  Will now attempt to repair.'.
					repository primitiveRecover.
					err retry ] ].
	"Do NOT cascade the following messages.  rollbackIfNecessary may replace my repository with a new one."
	repository rollbackIfNecessary.
	repository rollforwardIfPossible