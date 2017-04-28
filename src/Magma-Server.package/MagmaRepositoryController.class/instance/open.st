private
open
	"This is called when restarting controllers during image restart."
	| tried |
	tried := false.
	localLocation isPotentiallyOpen ifTrue: [ MagmaPotentiallyOpenError signal: 'found ' , self class openIndicatorFilename , ' file, indicating this repository may currently be open.  If it is not, you may proceed.' ].
	(FileDirectory on: self pathName) exists ifFalse: [ MagmaUserError signal: self pathName , ' not found.' ].
	[ self privateOpen: localLocation ]
		on: MagmaCorruptionError
		do:
			[ : err | 
			tried
				ifTrue: [ err pass ]
				ifFalse:
					[ MagmaRollbackRecoveryNeeded signal: 'Outage occurred while writing system-definitions!  Will now attempt to repair.'.
					repository primitiveRecover.
					self close.
					tried := true.
					err retry ] ].
	"Do NOT cascade the following messages.  rollbackIfNecessary may replace my repository with a new one."
	repository rollbackIfNecessary.
	repository rollforwardIfPossible