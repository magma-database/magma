as yet unclassified
testBlocks
	| reconstituted |
	reconstituted := MaObjectSerializer testMaterialize: MaFixtureFactory new blockSamples.
	MaFixtureFactory new verifyBlockSamples: reconstituted