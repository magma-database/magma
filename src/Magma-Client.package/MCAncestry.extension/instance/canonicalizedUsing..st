*magma-client
canonicalizedUsing: aMcModel 
	"Replace my ancestors with the ones in aMcModel, if they exist, or add them if they don't.  Descend the ancestry-tree until we are connected to canonicalized instances."
	^ aMcModel
		infoAssociationFor: self
		ifPresent:
			[ : existingAssoc | existingAssoc value ]
		ifAbsent:
			[ aMcModel addInfo: self.
			self ancestors withIndexDo:
				[ : each : index | ancestors
					at: index
					put: (each canonicalizedUsing: aMcModel) ].
			self ]