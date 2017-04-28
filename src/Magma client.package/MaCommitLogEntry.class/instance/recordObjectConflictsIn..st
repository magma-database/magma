private
recordObjectConflictsIn: aMaCommitPackage
	"Go through everyone who has challenged me.  Determine if they have a same changed
	oid that I have.  Also fail if a new instance of a class is being added and shouldn't be."

	aMaCommitPackage persistentObjectsDo:
		[ :eachObjectBuffer |
		challengingEntries do:
			[ :eachEntry |
(			(eachEntry hasCommitted: eachObjectBuffer oid)
and: [ eachObjectBuffer canConflict ])
				ifTrue:
					[ self
						failResultWith: eachEntry connection
						on: eachObjectBuffer oid ] ] ]