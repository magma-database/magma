private
canonicalizeAttributesOf: aMCVersion 
	"Make sure that, for all definitions in aMCVersion, we refer to an already-persistent equivalent, if present, and add it, if not."
	aMCVersion
		setPackage: (self canonicalizedPackageFor: aMCVersion)
		definitions: (self canonicalizedDefinitionsFor: aMCVersion)
		info: (self canonicalizedAncestryFor: aMCVersion)