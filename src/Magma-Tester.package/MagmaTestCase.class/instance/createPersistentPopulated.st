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
		setTimeoutSecondsTo: 240
		during: [ clientSession commit: [ self load: mc ] ].
	samplesInMc := samples copy asSet