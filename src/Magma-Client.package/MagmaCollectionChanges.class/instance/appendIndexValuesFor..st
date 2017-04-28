private
appendIndexValuesFor: aMaIndexDefinition
	"An index has been added.  Since the server processes all added and removed indexes prior to all added and removed objects, we need to make sure additions and removals have hash-index values for all indexes."

	self additionsDo:
		[ :eachObject :eachCollection |
		eachCollection add: (aMaIndexDefinition indexHashesFor: eachObject) ].
	self removedDo:
		[ :eachObject :eachCollection |
		eachCollection add: (aMaIndexDefinition indexHashesFor: eachObject) ]