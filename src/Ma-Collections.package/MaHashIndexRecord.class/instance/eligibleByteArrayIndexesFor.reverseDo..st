actions
eligibleByteArrayIndexesFor: keyInteger reverseDo: oneArgBlock

	(self highestByteArrayIndexFor: keyInteger)
		to: (self lowestByteArrayIndexFor: keyInteger)
		by: 0-entrySize
		do: [ :index | oneArgBlock value: index ]
