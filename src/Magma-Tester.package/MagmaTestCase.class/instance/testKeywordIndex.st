test keyword index
testKeywordIndex
	"Build a MagmaCollection of classes in the system, then add a keyword index by words in their class comments.  Build it as a Smalltalk structure as well, and use it to compare."

	| smalltalkVersion |
	smalltalkVersion := self
		remotePerform: #createInitialCollectionOfClasses
		in: 'client1'.
	smalltalkVersion := self
		remotePerform: #addKeywordIndexAndRemainingClassesUsing:
		with: smalltalkVersion
		in: 'client2'.
	self
		remotePerform: #verifyKeywordIndexUsing:
		with: smalltalkVersion
		in: 'client1'