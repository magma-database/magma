private
removeIndexValuesFor: aMaIndexDefinition
	"An index is being removed.  We need to make sure we remove
	the hash index values to the objects that have already been added or
	removed from the receiver."

	| position |

	position := collection indexes indexOf: aMaIndexDefinition.
	self additionsDo: [ :eachObject :eachCollection | eachCollection removeAt: position ].
	self removedDo: [ :eachObject :eachCollection | eachCollection removeAt: position ]
