packages
addPackagesWithNamesBeginning: aString
	"Add packages whose names begin with aString."
	PackageInfo allPackages do: 
		[ : each | 
		(each packageName 
			maBeginsWith: aString
			caseSensitive: self isCaseSensitive) ifTrue: [ self addPackage: each ] ]