*magma-server
graphDo: oneArgBlock using: aMaReadStrategy for: aMagmaFileTraverser
	aMagmaFileTraverser
		graphFromPointers: self
		do: oneArgBlock
		using: aMaReadStrategy