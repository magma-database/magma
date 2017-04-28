private
findCorrectNodeConfiguration
	"I'm just starting up, interrogate the other servers in my node to see what the current state of the party is:  who is the primary now?"
	| nodes |
	nodes := Array streamContents:
		[ : stream | self sessionsForOtherLocationsDo:
			[ : each | [ each ensureConnected.
			stream nextPut: each node ]
				on: NetworkError
				do:
					[ : err | "That server not up or not reachable."
					err ] ] ].
	"Do all the other nodes agree about who is primary?"
	(nodes size <= 1 or:
		[ (nodes collect:
			[ : each | each primaryLocation ]) asSet size = 1 ]) ifTrue:
		[ | primaryLoc |
		primaryLoc := nodes isEmpty ifFalse: [ nodes anyOne primaryLocation ].
		"Is the agreed-upon primary thisLocation?"
		(primaryLoc notNil and: [ primaryLoc = self thisLocation ])
			ifTrue: [ self ensureCorrectNodeConfiguration ]
			ifFalse:
				[ primaryLoc ifNotNil: [ self beWarmBackupFor: primaryLoc ] ] ]