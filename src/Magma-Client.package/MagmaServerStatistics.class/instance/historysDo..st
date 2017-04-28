private
historysDo: aBlock 
	super historysDo: aBlock.
	aBlock value: flushTimeHistory