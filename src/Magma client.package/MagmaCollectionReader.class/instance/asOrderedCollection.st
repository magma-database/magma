converting
asOrderedCollection
	"Answer an OrderedCollection of me."

	^OrderedCollection new setContents: (self asArray: self size); yourself