*ma files additions
directoryTreeDo: oneArgBlock entries: entriesCollection 
	"Value oneArgBlock with the path (an OrderedCollection of FileDirectory's) to each DirectoryEntry and the DirectoryEntry itself."
	self entries do: 
		[ : each | 
		entriesCollection add: each.
		oneArgBlock value: entriesCollection.
		each isDirectory ifTrue: 
			[ | subdir |
			subdir := each asFileDirectory.
			subdir 
				directoryTreeDo: oneArgBlock
				entries: entriesCollection ].
		entriesCollection removeLast ]