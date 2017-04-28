*magma server
graphDo: oneArgBlock using: aMaReadStrategy for: aMagmaFileTraverser
	"Though I am an object stored in a different representation, that representation is fully part of the repository, so enumerate the buffers my MaSerializedGraphBuffers buffers."
	oneArgBlock value: self.
	self buffersDo:
		[ : eachBuffer |
		"The buffers of a storage-object are never assigned permanent oids.  But if already-persistent objects are referenced from the storage-object, they will be and should be traversed normally."
		(MaOidCalculator isOidForUserObject: eachBuffer oid)
			ifTrue:
				[ eachBuffer
					graphDo: oneArgBlock
					using: aMaReadStrategy
					for: aMagmaFileTraverser ]
			ifFalse:
				[ oneArgBlock value: eachBuffer ] ]