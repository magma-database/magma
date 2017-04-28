building
addLargeCollectionChanges: aMaLargeCollectionChanges using: aMagmaSession
	"Add a copy of the changes instead of the originals because each serialization mutates the changes from first-class objects into oids."
	self addLargeCollectionChanges: aMaLargeCollectionChanges copyForSerialization.
	"Make sure we get new objects that may only be referenced by a LargeCollection."
	aMaLargeCollectionChanges
		addNewAdditionsTo: self
		using: aMagmaSession