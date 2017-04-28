*ma object serialization
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer
	"Materialize the association:  change set name -> the stream on which the change set was filed out.
	Signal the incoming chang-set notification and, if the user has written code to override the defaultAction, it will be filed in the name isn't already in use."
	| nameAndChangeSetAssociation changeSetName stream |
	nameAndChangeSetAssociation := (aMaObjectSerializer materializeGraph: aByteArray).
	changeSetName := nameAndChangeSetAssociation key.
	stream := nameAndChangeSetAssociation value.
	^ (MaIncomingChangeSetNotification signal: 'Is it ok to file-in ', changeSetName) == true "default to false if they return with a non-boolean."
		ifTrue:
			[ ChangeSorter
				newChangesFromStream: stream
				named: changeSetName ]
		ifFalse: [ ChangeSorter existingOrNewChangeSetNamed: changeSetName ]