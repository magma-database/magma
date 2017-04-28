packages
addAllPackages
	PackageInfo allPackages do: [ : each | self addPackage: each ]