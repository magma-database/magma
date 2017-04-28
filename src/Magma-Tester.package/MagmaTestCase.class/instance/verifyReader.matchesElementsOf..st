test major functions
verifyReader: aMagmaCollectionReader matchesElementsOf: localCollection 
	"Because MagmaCollection indexes are sensitive only to the first few characters, test assertions were failing on multiple entries that were identical within the sensitive range because they were reversed.  This method compares the two in a way that allows this slight difference in order."
	"quick test"
	| sortedHashValues localEntries largeCollection index |
	self should: [ aMagmaCollectionReader size = localCollection size ].

	"build work collections, sortedHashValues and localEntries."
	index := aMagmaCollectionReader sortIndex.
	sortedHashValues := (localCollection collect: [ : each | index indexHashFor: each ]) asSortedCollection.
	localEntries := Dictionary new.
	localCollection do: 
		[ : each | 
		(localEntries 
			at: (index indexHashFor: each)
			ifAbsentPut: [ Bag new ]) add: each ].

	"now verify the reader using at:"
	1 
		to: sortedHashValues size
		do: 
			[ : x1 | 
			| indexHashFromMagmaCollection indexedObject |
			indexedObject := aMagmaCollectionReader at: x1.
			indexHashFromMagmaCollection := index indexHashFor: indexedObject.
			self should: [ (sortedHashValues at: x1) = indexHashFromMagmaCollection ].
			self should: 
				[ ((localEntries at: indexHashFromMagmaCollection) occurrencesOf: indexedObject) = 1 ] ].
	"verify reader"
	largeCollection := OrderedCollection new.
	aMagmaCollectionReader do: [ : each | largeCollection add: each ].
	1 
		to: sortedHashValues size
		do: 
			[ : x2 | 
			self should: 
				[ (sortedHashValues at: x2) = (index indexHashFor: (largeCollection at: x2)) ].
			self should: 
				[ ((localEntries at: (sortedHashValues at: x2)) occurrencesOf: (largeCollection at: x2)) = 1 ] ]