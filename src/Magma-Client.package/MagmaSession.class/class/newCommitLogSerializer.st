private
newCommitLogSerializer
	"Unfortunately, for legacy support, we cannot use the #protocol API, because it sorts the classes by name."
	| answer |
	answer := MaObjectSerializer new.
	{ 
		Association.
		UUID.
		MaCommitLogEntry.
		MaCommitPackage.
		IdentityDictionary.
		MaCommitResult.
		MaSerializedGraphBuffer.
		MaChangedKeySpecification.
		LargePositiveInteger.
		MagmaIndexDescription.
		MagmaClientConnection.
		MaObjectBuffer.
		MaFixedObjectBuffer.
		MaVariableBuffer.
		MaByteObjectBuffer.
		MaStorageObjectBuffer.
		MaVariableObjectBuffer.
		MaVariableWordBuffer.
		MagmaArrayChanges.
		MagmaCollectionChanges.
		MagmaSetChanges.
		MaIdentityDictionary
	 } do: [ : each | answer classIdManager addNewClass: each ].
	^ answer