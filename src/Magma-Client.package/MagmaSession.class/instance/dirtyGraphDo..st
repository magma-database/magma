accessing
dirtyGraphDo: threeArgBlock
	"Value threeArgBlock with every object that would be included in the next commit."
	self changedObjects
		maGraphDo: threeArgBlock
		using: serializer traversalStrategy