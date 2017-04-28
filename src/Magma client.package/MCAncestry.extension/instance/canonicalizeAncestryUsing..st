*magma client
canonicalizeAncestryUsing: aMcModel 
	"Replace my ancestors with the ones in aMcModel, if they exist, or add them if they don't.  Descend the ancestry-tree until we are connected to canonicalized instances."
	self ancestors withIndexDo:
		[ : each : index | | shouldDescend |
		shouldDescend := false.
		aMcModel
			infoAssociationFor: each
			ifPresent:
				[ : existingAssoc | ancestors
					at: index
					put: existingAssoc value ]
			ifAbsent:
				[ aMcModel addInfo: self.
				shouldDescend := true ].
		shouldDescend ifTrue: [ each canonicalizeAncestryUsing: aMcModel ] ]