*magma-server
hasExcessiveChallengers
	^ challengingEntries size >= self connection maximumNumberOfChallengers or:
		[ | lastAccess |
		lastAccess := self connection lastAccess.
		lastAccess notNil and: [ (Time millisecondsSince: lastAccess) > 1800000 "30 minutes" ] ]