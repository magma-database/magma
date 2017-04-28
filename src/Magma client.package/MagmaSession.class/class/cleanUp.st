initializing
cleanUp
	"References to MagmaSessions get stuck in old MethodContext's, preventing garbage-collection.  Run this method and these instances will be cleaned."
	| before after |
	self disconnectAndCloseAllConnectedSessions.
	Smalltalk garbageCollect.
	before := self allSubInstances size.
"No longer becoming sessions to nil, because there could be proxies referencing sessions, which are needed especially if you are using Magma as a MC repository.  Really the only issue is when they got stuck in MethodContexts, which even that might no longer be an issue now that Squeak has full closures."
"	self allSubInstances do: 
		[ : each | 
		each 
			becomeForward: nil
			copyHash: false ]."
	Smalltalk garbageCollect.
	self allSubInstances do: 
		[ : each | 
		(PointerFinder pointersTo: each) do: [ : referencer | referencer class == MethodContext ifTrue: [ referencer receiver: nil ] ] ].
	Smalltalk garbageCollect.
	after := self allSubInstances size.
	SystemNavigation default allObjectsDo: 
		[ : e | 
		((e class inheritsFrom: Object) and: [ e isBehindWriteBarrier ]) ifTrue: [ e primitiveChangeClassTo: e class superclass basicNew ] ].
	^ 'MagmaSession instances (before->after):  ' , (before -> after) printString