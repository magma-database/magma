*magma-client-private
canonicalizeReferencesUsing: aMcModel 
	"Make sure that, for all definitions in aMCVersion, we refer to an already-persistent equivalent, if present, and add it, if not."
	package := aMcModel canonicalizedPackageFor: self.
	info := info canonicalizedUsing: aMcModel.
	snapshot setDefinitions: (aMcModel canonicalizedDefinitionsFor: self)