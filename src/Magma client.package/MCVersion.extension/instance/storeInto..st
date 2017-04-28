*magma client-private
storeInto: aMcModel 
	(aMcModel includesVersion: self) ifTrue: [ ^ aMcModel ].
	MagmaPreferences suspendStatusViaCursorWhile:
		[ aMcModel
			 canonicalizeAttributesOf: self ;
			 addVersion: self ;
			 adjustMissingVersions: self info ]