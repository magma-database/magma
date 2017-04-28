test forward recovery
startAddStrings: expectNetworkError 
	| oc serverDown counter |
	oc := self remoteStringCollection.
	serverDown := false.
	forwardRecoveryRequirement := OrderedCollection new.
	counter := 50000 atRandom.
	clientSession
		 begin ;
		 timeoutSeconds: 10.
	shouldStopFlooding := false.
	[ [ [ serverDown or: [ shouldStopFlooding ] ] whileFalse:
		[ oc add: counter printString.
		[ clientSession commitAndBegin.
		"When the server is ripped down, the last commit, above, either succeeded or it didn't, so we must be forgiving by one when we verify."
		forwardRecoveryRequirement add: counter printString.
		counter := counter + 1 ]
			on: NetworkError
			do:
				[ : err | oc size < 3 ifTrue: [ self halt: 'Why the network error?' ].
				expectNetworkError
					ifTrue: [ serverDown := true ]
					ifFalse: [ err pass ] ] ] ] ensure: [ clientSession timeoutSeconds: 172800 "2 days" ] ] newProcess
		 name: thisContext selector ;
		 resume