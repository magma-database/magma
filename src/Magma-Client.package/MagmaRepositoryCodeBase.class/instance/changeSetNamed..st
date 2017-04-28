change sets
changeSetNamed: aString

	^ changeSets
		at: aString
		ifAbsent: [ MagmaUserError signal: 'No change set named ', aString, ' found here.' ].