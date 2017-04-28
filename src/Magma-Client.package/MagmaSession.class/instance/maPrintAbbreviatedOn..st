private
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	self isLocal
		ifTrue:
			[ self location ifNotNilDo:
				[ : loc | loc maPrintAbbreviatedOn: aStream ] ]
		ifFalse:
			[ primaryLink maPrintAbbreviatedOn: aStream.
			self isHighlyAvailable ifTrue:
				[ aStream space.
				secondaryLink maPrintAbbreviatedOn: aStream ] ]