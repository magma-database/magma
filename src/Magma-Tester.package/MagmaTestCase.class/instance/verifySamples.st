test objects
verifySamples

	| newSamples materializedSamples |
	clientSession abort.
	newSamples := MaFixtureFactory new samples.
	(materializedSamples := clientSession root at: 'samples') keysAndValuesDo:
		[ : eachSelector : eachSamples |
		eachSamples with: (newSamples at: eachSelector) do:
			[ : eachMaterialized : eachNew |
			self should: [ eachMaterialized maEquivalentForSerializationTest: eachNew ] ] ].
	(newSamples at: #specialGlobalCollections)
		with: (materializedSamples at: #specialGlobalCollections)
		do:
			[ : eachInImage : eachMaterialized |
			self should: [ eachInImage == eachMaterialized ] ]