removed
removedDo: twoArgBlock
	"The first argument is each object that has been added during the current
	transaction, the second is a collection of hash-index values for each index."

	self hasRemoved ifFalse: [ ^self ].
	self removed keysAndValuesDo: twoArgBlock
