test querys - non-persistent populated
testNonPersistentPopulated
	| mc oc |
	self initializeSamples.
	mc := self newMc.
	self load: mc.
	samplesInMc := (mc asArray: mc size) asSet.
	oc := OrderedCollection new: samples size.
	"Make a new copy of the samples because dressUp will modify the objects in-place, we want to do that independently for the mc and oc."
	self initializeSamples.
	self load: oc.
	self 
		verifyMc: mc
		against: oc.
	self
		addSomeRemoveSome: mc ;
		addSomeRemoveSome: oc.
	self 
		verifyMc: mc
		against: oc