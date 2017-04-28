initialize-release
initializeChallengers
	challengingEntries := OrderedCollection new.
	self connection ifNotNil: [ : conn | conn resetChallengingBytes ]