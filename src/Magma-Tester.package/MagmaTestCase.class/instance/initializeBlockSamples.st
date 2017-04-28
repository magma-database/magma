test blocks
initializeBlockSamples
	clientSession commit:
		[ clientSession root
			at: #testBlocks
			put: MaFixtureFactory new blockSamples ]