private
canonicalizedPackageFor: aMCVersion 
	"Find or create a canonicalized MCPackage for aMCVersion. "
	^ packages
		at: aMCVersion package name
		ifAbsentPut: [ aMCVersion package ]