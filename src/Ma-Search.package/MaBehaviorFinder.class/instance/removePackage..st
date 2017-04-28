packages
removePackage: aPackageInfo 
	aPackageInfo methods do: [ : each | self removeMethod: each ]