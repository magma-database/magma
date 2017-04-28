packages
selectPackage: aPackageInfo 
	"Remove all methods except those in aPackageInfo."
	self selectMethods: [ : each | each packageInfo = aPackageInfo ]