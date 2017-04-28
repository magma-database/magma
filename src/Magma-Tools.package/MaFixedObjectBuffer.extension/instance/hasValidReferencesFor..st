*magma-tools
hasValidReferencesFor: aMaObjectFiler 
	self instVarsDoWithIndex: 
		[ : eachOid : x | 
		(self 
			isValidOid: eachOid
			for: aMaObjectFiler) ifFalse: [ ^ false ] ].
	^ true