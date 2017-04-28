*magma server
graphDo: oneArgBlock using: aMaReadStrategy for: aMagmaFileTraverser
	aMagmaFileTraverser
		graphFromPointers: self
		do: oneArgBlock
		using: aMaReadStrategy.
	(aMagmaFileTraverser isForLargeCollection: self)
		ifTrue:
			[ aMagmaFileTraverser
				graphFromLargeCollection: self oid
				do: oneArgBlock
				using: aMaReadStrategy ]