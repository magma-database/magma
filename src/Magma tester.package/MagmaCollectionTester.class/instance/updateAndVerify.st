test querys - persistent populated
updateAndVerify
	| mc oc |
	mc := clientSession refresh root at: 'testPersistentPopulated'.
	samplesInMc := (mc asArray: mc size) asSet.
	self
		initializeSamples ;
		initializeNonPersistentSamples.
	samplesInMc addAll: nonPersistentSamples.
	oc := OrderedCollection new: samples size.
	self
		load: oc ;
		addSomeRemoveSome: mc ;
		addSomeRemoveSome: oc.
	"changeSomeKeysIn: mc do: [ : each | clientSession noteOldKeysFor: each ] ;
		changeSomeKeysIn: oc do: [ : each | ];"
	self 
		verifyMc: mc
		against: oc