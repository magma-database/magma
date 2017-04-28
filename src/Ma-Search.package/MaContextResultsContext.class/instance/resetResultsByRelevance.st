initialize-release
resetResultsByRelevance
	"Answer an Array whose elements parallel those of my sources #relevanceNames."
	resultsByRelevance := (Array new: source relevanceNames size) collect: [ : each | OrderedCollection new ].
	self changed