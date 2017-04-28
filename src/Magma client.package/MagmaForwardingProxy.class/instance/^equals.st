testing
= anObject 
	^ (anObject maIsForwardingProxy and: [ self fpRemoteMagmaId notNil or: [ anObject fpRemoteMagmaId notNil ] ]) 
		ifTrue: 
			[ (self == anObject or: 
				[ self fpRemoteMagmaId = anObject fpRemoteMagmaId and: [ self fpRemoteOid = anObject fpRemoteOid ] ]) or: [ self realObject = anObject realObject ] ]
		ifFalse: [ self realObject = anObject realObject ]