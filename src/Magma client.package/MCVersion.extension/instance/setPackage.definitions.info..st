*magma client-private
setPackage: aMCPackage definitions: anOrderedCollection info: aMCVersionInfo
	"Magma-hosted MC repositories canonicalize all of their objects.  This is used to replace my 'definitions' instances with the canonicalized instances."
	package := aMCPackage.
	snapshot setDefinitions: anOrderedCollection.
	info := aMCVersionInfo