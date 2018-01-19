packages
packages
	^ packages ifNil: 
		[ packages := Set new.
		"Use one of two different approaches to calculate packages to maximize efficiency."
		self methods size < 150 
			ifTrue: 
				[ |x| x := 0. 'Calculating packages...' 
					displayProgressFrom: 1
					to: self methods size
					during: 
						[ : bar | 
						self methods do: 
							[ : each | 
							bar value: (x:=x+1).
							each packageInfo ifNotNil: [ : pkg | packages add: pkg ] ] ] ]
			ifFalse: 
				[ 'Calculating packages...' 
					displayProgressAt: Display topCenter
					from: 1
					to: PackageInfo allPackages size
					during: 
						[ : bar | 
						PackageInfo allPackages withIndexDo: 
							[ : eachPackage : x | 
							bar value: x.
							((self methods includesAnyOf: eachPackage coreMethods) or: [ self methods includesAnyOf: eachPackage methods ]) ifTrue: [ packages add: eachPackage ] ] ] ].
		packages := packages asSortedCollection: [ : a : b | a packageName < b packageName ] ]