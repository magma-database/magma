testing
differencesFor: differencesKey 
	^ self differences
		at: differencesKey
		ifAbsent: [ Array empty ]