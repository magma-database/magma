private
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	"Check if guard isCritical because it causes inconvenient UI-lockups."
	guard isCritical ifFalse: 
		[ self isLocal 
			ifTrue: 
				[ self location ifNotNilDo: [ : loc | loc maPrintAbbreviatedOn: aStream ] ]
			ifFalse:
				[ primaryLink maPrintAbbreviatedOn: aStream.
				self isHighlyAvailable ifTrue: 
					[ aStream space.
					secondaryLink maPrintAbbreviatedOn: aStream ] ] ]