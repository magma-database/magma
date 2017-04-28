*ma object serialization
maUsesStandardStorage

	^ self ~~ (TextConstants at: #DefaultTabsArray)
	and: [ self ~~ (TextConstants at: #DefaultMarginTabsArray) ]