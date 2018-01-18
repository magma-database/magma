*ma-search
maNewSearchContext
	^ MaCompositeContext new
		addContext: 
			((MaFileDirectoryContext forFileNamesIn: self)
				name: 'file names' ;
				yourself) ;
		addContext: 
			((MaFileDirectoryContext forFileContentsIn: self)
				name: 'file contents' ;
				yourself) ;
		yourself