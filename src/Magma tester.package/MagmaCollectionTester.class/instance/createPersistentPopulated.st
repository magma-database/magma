test querys - persistent populated
createPersistentPopulated
	| mc |
	self initializeSamples.
	mc := self newMc.
	clientSession commit: 
		[ clientSession root 
			at: 'testPersistentPopulated'
			put: mc ].
	"This commit can take a bit on a slow machine."
	clientSession 
		waitUpTo: 240 seconds
		for: [ clientSession commit: [ self load: mc ] ].
	samplesInMc := samples copy asSet