private
openFile: unqualifiedName 
	^ MaAtomicFileStream fileNamed: (directory fullNameFor: unqualifiedName)