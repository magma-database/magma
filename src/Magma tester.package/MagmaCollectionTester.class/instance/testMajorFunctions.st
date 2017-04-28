test major functions
testMajorFunctions
	"This test builds a local Smalltalk collection and a MagmaCollection in parallel.  The local is built in client1.  Most of the MagmaCollection is built in client2.  At the end, client1 verifies the MagmaCollection against the local."
	| tempSamples sample1 sample2 changedIndexKeys localEntriesToRemove stringsToReverse collectionOid |
	tempSamples := (MaObject withAllSubclasses collect: [ : each | each name asString ]) asArray.
	sample1 := tempSamples 
		copyFrom: 1
		to: tempSamples size // 2.
	sample2 := tempSamples 
		copyFrom: tempSamples size // 2 + 1
		to: tempSamples size.
	"client2 creates the collection, adds some objects."
	collectionOid := self 
		addAll: sample1
		at: 'testMajorFunctions'.
	"client1 adds an index."
	self 
		remotePerform: #addIndex
		in: 'client1'.
	"now client2 resumes adding with sample2."
	self 
		addAll: sample2
		at: 'testMajorFunctions'.
	changedIndexKeys := self 
		remotePerform: #changeIndexKeysInClient1
		in: 'client1'.
	localEntriesToRemove := self 
		remotePerform: #removeSomeEntriesInClient2Including:
		with: changedIndexKeys first
		in: 'client2'.
	self 
		remotePerform: #removeFromLocalRoot:at:
		withArguments: {  localEntriesToRemove. 'testMajorFunctions'  }
		in: 'client1'.
	stringsToReverse := self 
		remotePerform: #changeIndexKeysInClient2
		in: 'client2'.
	self 
		remotePerform: #reverseLocalStrings:
		with: stringsToReverse
		in: 'client1'.
	self 
		remotePerform: #verifyReaderMatchesLocalAt:on:
		withArguments: #('testMajorFunctions' #yourself )
		in: 'client1'.
	self 
		remotePerform: #verifyIndexFilesFor:present:
		withArguments: {collectionOid. true}
		in: 'server'.
	self 
		remotePerform: #removeIndex
		in: 'client2'.
	"verify the actual collection in client1."
	self 
		remotePerform: #verifyLargeCollectionAt:
		with: 'testMajorFunctions'
		in: 'client2'.
	"Make sure caches flushed."
	(Delay forSeconds: 5) wait.
	self 
		remotePerform: #verifyIndexFilesFor:present:
		withArguments: {collectionOid. false}
		in: 'server'.