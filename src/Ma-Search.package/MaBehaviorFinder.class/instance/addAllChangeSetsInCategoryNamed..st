change sets
addAllChangeSetsInCategoryNamed: aString
	"Add methods in ChangeSets in category named aString."
	(ChangeSorter changeSetCategoryNamed: aString) changeSetList
		do:
			[ :each | self addChangeSetNamed: each ]