enumeration
do: aBlock

	resultsByRelevance ifNotNil:
		[ resultsByRelevance do: [ : eachCollection | eachCollection do: aBlock ] ]