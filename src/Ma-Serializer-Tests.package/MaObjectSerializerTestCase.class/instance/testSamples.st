as yet unclassified
testSamples
	| newSamples |
	newSamples := MaFixtureFactory current samples.
	self assert: ((MaObjectSerializer testMaterialize: newSamples) maEquivalentForSerializationTest: newSamples)