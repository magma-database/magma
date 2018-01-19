*magma-server
cleanUp
	"References to MagmaSessions get stuck in old MethodContext's, preventing garbage-collection.  Run this method and these instances will be cleaned."
	| before after proxies reals |
"	MagmaCollectionReader allSubInstances do:
		[ : each | each magmaSession ifNotNil:
			[ : sess | sess isConnected ifTrue: [ each release ] ] ].
"	self disconnectAndCloseAllConnectedSessions.
	WBMethodBuilder initialize.
	MagmaRepositoryController initialize.
	MCMagmaRepository allSubInstances do:
		[ : each | each cleanUp ].
	MaObjectRepository allInstances do:
		[ : each | each unregisterAsMemoryHog ].
	World cleanseStepList.
	WorldState cleanUp.
	Smalltalk garbageCollect.
	before := self allSubInstances size.
	Smalltalk hasMaui ifTrue:
		[ (Smalltalk classNamed: #MauiWorld) current
			 clipboard: nil ;
			 rehashPlayers.
		(Smalltalk classNamed: #MauiBlockMorph) allInstances do:
			[ : each | each receiver isMauiPrototype ifTrue: [ each resetReceiver ] ] ].
	(Smalltalk classNamed: #TeCellAddress) ifNotNilDo:
		[ : teCellAddress | teCellAddress initializeReusableAddress ].
	proxies := MagmaMutatingProxy allInstances select:
		[ : each | each maRealObjectIsReified ].
	reals := proxies collect:
		[ : each | each realObjectIfMutatingProxy ].
	proxies
		elementsForwardIdentityTo: reals
		copyHash: false.
	Smalltalk garbageCollect.
	self allSubInstances do:
		[ : each | (each pointersTo) do:
			[ : referencer | referencer class == MethodContext ifTrue: [ referencer receiver: nil ] ] ].
	Smalltalk garbageCollect.
	after := self allSubInstances size.
	(after > 0 and: [ Smalltalk hasMaui ]) ifTrue:
		[ (Smalltalk classNamed: #MauiMorph) allSubInstances do:
			[ : each | each object isMauiPrototype ifTrue: [ each resetObject ] ].
		Smalltalk garbageCollect.
		after := self allSubInstances size ].
	SystemNavigation default allObjectsDo:
		[ : e | ((e class inheritsFrom: Object) and: [ e isBehindWriteBarrier ]) ifTrue:
			[ [ e primitiveChangeClassTo: e class superclass basicNew ]
				on: Error
				do:
					[ : err | err ] ] ].
	^ 'MagmaSession instances (before->after):  ' , (before -> after) printString