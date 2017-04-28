private
primRemoveVersion: aMCVersion 
	objects
		removeKey: aMCVersion id
		ifAbsent: [ "whatever." ].
	objects
		removeKey: aMCVersion versionName
		ifAbsent: [  ].
	(objects
		at: aMCVersion packageName
		ifAbsent: [  ]) ifNotNil:
		[ : vers | vers
			remove: aMCVersion
			ifAbsent: [  ] ].
	^ aMCVersion