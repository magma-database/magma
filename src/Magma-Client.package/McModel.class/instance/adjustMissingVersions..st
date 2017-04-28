private
adjustMissingVersions: aMCVersionInfo 
	"aMCVersion is being added, make sure it isn't marked as missing and check for presence of its ancestors."
	missingVersions
		remove: aMCVersionInfo
		ifAbsent: [ "don't want it." ].
	aMCVersionInfo ancestors do:
		[ : eachAncestor | self
			versionWithInfo: eachAncestor
			ifAbsent: [ missingVersions add: eachAncestor ] ]