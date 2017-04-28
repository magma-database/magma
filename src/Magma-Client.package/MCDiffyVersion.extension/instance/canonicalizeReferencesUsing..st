*magma-client-private
canonicalizeReferencesUsing: aMcModel 
	"Make sure that, for all definitions in aMCVersion, we refer to an already-persistent equivalent, if present, and add it, if not."
	super canonicalizeReferencesUsing: aMcModel.
	base := base canonicalizedUsing: aMcModel.
	patch
		canonicalizeFor: self
		using: aMcModel