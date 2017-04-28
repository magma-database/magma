*ma base additions
maPackageInfo
	^ PackageInfo allPackages 
		detect: [ : each | each includesClass: self ]
		ifFound: [ : foundPackage | PackageInfo named: foundPackage packageName ]
		ifNone: [ nil ]