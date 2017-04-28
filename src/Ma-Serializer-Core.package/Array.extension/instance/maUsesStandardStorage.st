*ma-serializer-core
maUsesStandardStorage

	^ self ~~ (TextConstants at: #DefaultTabsArray)
	and: [ self ~~ (TextConstants at: #DefaultMarginTabsArray) ]