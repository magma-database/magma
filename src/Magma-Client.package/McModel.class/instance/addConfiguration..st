private
addConfiguration: aMCConfiguration 
	| versionName packageName |
	versionName := aMCConfiguration versionName.
	packageName := aMCConfiguration versionName packageName.
	versionName = packageName ifTrue: [ MaUserError signal: 'Invalid name for MCConfiguration.' ].
	objects
		at: versionName
		ifPresent:
			[ : found | (found yourself isKindOf: MCVersion) ifTrue: [ MaUserError signal: 'Names of Configurations may not coincide with names of Versions.' ] ]
		ifAbsent: [  ].
	objects
		at: packageName
		ifPresent:
			[ : found | (found yourself isKindOf: MCVersion) ifTrue: [ MaUserError signal: 'Names of Configurations may not coincide with names of Packages.' ] ]
		ifAbsent: [  ].
	objects
		
		at: versionName
		put: aMCConfiguration ;
		
		at: packageName
		put: (Array with: aMCConfiguration).
	"Not actually a MCPackage, we only need to store the name, to satisfy #allPackageNames."
	packages
		at: packageName
		put: nil