actions
eligibleByteArrayIndexesFor: keyInteger do: oneArgBlock

	(self lowestByteArrayIndexFor: keyInteger)
		to: (self highestByteArrayIndexFor: keyInteger)
		by: entrySize
		do: [ :index | oneArgBlock value: index ]
