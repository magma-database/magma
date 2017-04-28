packages
addPackagesWithNamesContaining: aString 
	"Add methods of all loaded packages whose names contain the sub-string, aString."
	PackageInfo allPackages do: 
		[ : each | 
		(each packageName 
			includesSubstring: aString
			caseSensitive: self isCaseSensitive) ifTrue: [ self addPackage: each ] ]