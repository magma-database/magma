private
primRemoveConfiguration: aMCConfiguration 
	| versionName packageName |
	versionName := aMCConfiguration versionName.
	packageName := aMCConfiguration versionName packageName.
	objects
		
		removeKey: versionName
		ifAbsent: [  ] ;
		
		removeKey: packageName
		ifAbsent: [  ].
	packages
		removeKey: packageName
		ifAbsent: [  ].
	^ aMCConfiguration