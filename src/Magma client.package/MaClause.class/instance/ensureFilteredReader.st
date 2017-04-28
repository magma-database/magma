private
ensureFilteredReader
	reader isFiltered ifFalse: 
		[ reader removeListener.
		reader become: reader asFilteredReader.
		reader setUpListener ]