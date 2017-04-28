private-querys tests
assertMc: aMagmaCollectionReader includesAll: anOrderedCollection 
	"We cannot assume sizes will be equal because select: does not include element once for each qualifying clause like readers do.."
	self assert: ((aMagmaCollectionReader asArray: aMagmaCollectionReader size) maIncludesAll: anOrderedCollection)