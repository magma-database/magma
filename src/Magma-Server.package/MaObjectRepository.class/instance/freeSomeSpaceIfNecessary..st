actions
freeSomeSpaceIfNecessary: sessionId 
	| totalFreed count |
	totalFreed := count := 0.
	"Free SockeStream buffers first, then, only if enough could not be retcovered, start terminating sessions.."
	(EmergencyMemory isEmpty or: [ self isLowOnMemory ]) ifTrue:
		[ transactionLog entriesDo:
			[ : each | each isRemote ifTrue: [ each resetSocketStreamBuffer ].
			Smalltalk garbageCollect.
			self isLowOnMemory ifFalse: [ ^ self ] ] ].
	[ (EmergencyMemory isEmpty or: [ self isLowOnMemory ]) and: [ transactionLog numberOfEntries > 1 ] ] whileTrue:
		[ | oldestEntry |
		oldestEntry := transactionLog removeOldestEntryExceptFrom: sessionId.
		oldestEntry notNil and:
			[ totalFreed := totalFreed + oldestEntry bytesConsumed.
			count := count + 1 ].
		Smalltalk garbageCollect.
		(totalFreed > 50 million and: [ EmergencyMemory isEmpty ]) ifTrue: [ self reserveEmergencySpace ] ].
	count > 0 ifTrue:
		[ MagmaServerLowOnMemoryNotification signal: count asString , ' sessions terminated to recover ' , totalFreed asBytesDescription , ' of server memory.'.
		self isOpen ifFalse: [ self unregisterAsMemoryHog ] ]