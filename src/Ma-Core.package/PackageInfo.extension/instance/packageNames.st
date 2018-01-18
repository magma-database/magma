*ma-core
packageNames
	"My name and the names of the all direct and indirect prerequistes."
	^ self allPrerequisitePackageNames
		add: self packageName ;
		yourself