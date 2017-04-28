recover
primitiveRecoverUsing: aMaObjectRepository 
	"This recovery only happens if there was an outage exactly at the moment where the system was writing its own definition.  In that case, it would not even be able to open properly to perform a normal recovery; therefore we do this initial recovyer which should then *allow* it to materialize its definition so that it can then perform a normal recovery which will get the large-collections.  Whew!"
	MagmaRecoveryNotification signal: 'System recovery needed!'.
	[ self applyRecordsDo: 
		[ : eachRecoveryRecord | 
		(eachRecoveryRecord isApplyToFile and: 
			[ eachRecoveryRecord isForObjectsFile or: [ eachRecoveryRecord isForFilePositionsFile ] ]) ifTrue: [ aMaObjectRepository unapply: eachRecoveryRecord ] ] ] 
		on: MaUnreadableRecoveryRecord
		do: 
			[ : error | 
			MagmaRecoveryNotification signal: error messageText , '.  System recovery complete.' ].
	^ true