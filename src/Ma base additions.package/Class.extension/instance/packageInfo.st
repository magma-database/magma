*ma base additions
packageInfo
	^ PackageInfo allPackages
		detect: [ : each | each includesClass: self ]
		ifNone: [ nil ]