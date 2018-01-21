monticello
packageInfo
	"Answer the PackageInfo containing this method."
	| methodCategory classCategory |
	methodCategory := self category.
	classCategory := methodCategory first = $* ifFalse: [ self actualClass theNonMetaClass category ].
	^ PackageInfo allPackages 
		detect: 
			[ : each | 
			"detect: [ : each | each methods includes: self ]" "<-- too slow"
			(each isYourClassExtension: methodCategory) or: 
				[ classCategory notNil and: [ each systemCategories includes: classCategory ] ] ]
		ifFound: [ : foundPackage | PackageInfo named: foundPackage packageName ]
		ifNone: [ nil ]