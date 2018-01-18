private
seriesChanged
	cachedMaxPoint := cachedMinPoint := nil.
	owner isNil ifTrue: [ ^ self ].
	self changed