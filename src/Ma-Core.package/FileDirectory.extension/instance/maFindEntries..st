*ma-core
maFindEntries: oneArgBlock 
	"Traverse my directory and answer an OrderedCollection of DirectoryEntry's whose path of DirectoryEntry's causes oneArgBlock to value true."
	| answer |
	answer := OrderedCollection new.
	self directoryTreeDo: [ : path | (oneArgBlock value: path) ifTrue: [ answer add: path last ] ].
	^ answer