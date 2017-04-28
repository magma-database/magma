initialize-release
close
	self isOpen ifFalse: [ ^ self ].
	wantsToClose := true.
	[ applyProcess notNil and: [ applyProcess isTerminated not ] ] whileTrue: [ (Delay forSeconds: 1) wait ].
	[ largeCollectionManagers anySatisfy: [ : each | each isLoading ] ] whileTrue: [ (Delay forMilliseconds: 500) wait ].
	self commitCritical: 
		[ (self isOpen and: [ self restoreMode not ]) ifTrue: [ self flushCritical: [ self flushCache	"just to be sure" ] ] ].
	filer ifNotNil: [ filer close ].
	largeCollectionManagers do: [ : each | each close ].
	recoveryManager ifNotNil: [ recoveryManager close ].
	self unregisterAsMemoryHog