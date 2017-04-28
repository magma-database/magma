accessing
additionsDo: twoArgBlock
	"The first argument is each object that has been added during the current
	transaction, the second is a collection of hash-index values for each index."

	self hasAdditions ifFalse: [ ^self ].
	self added keysAndValuesDo: twoArgBlock
