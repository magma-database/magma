*magma-client-private
storeInto: aMcModel 
"	self versionName isValid ifFalse: [ MagmaUserError signal: 'Cannot support mal-named versions.' ]."  "<---- Why not?"
	(aMcModel includesVersion: self) ifTrue: [ ^ aMcModel ].
	MagmaPreferences suspendStatusViaCursorWhile:
		[ self canonicalizeReferencesUsing: aMcModel.
		aMcModel
			 addVersion: self ;
			 adjustMissingVersions: self info ]