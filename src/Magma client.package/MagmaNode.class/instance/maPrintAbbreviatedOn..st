printing
maPrintAbbreviatedOn: aStream 
	super maPrintAbbreviatedOn: aStream.
	locations do: 
		[ : each | 
		aStream maPrint: each.
		each == locations last ifFalse: [ aStream maPrint: ', ' ] ]