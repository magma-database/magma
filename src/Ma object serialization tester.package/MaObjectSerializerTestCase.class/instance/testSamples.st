as yet unclassified
testSamples
	| newSamples |
	newSamples := MaFixtureFactory current samples.
	(MaObjectSerializer testMaterialize: newSamples) maEquivalentForSerializationTest: newSamples