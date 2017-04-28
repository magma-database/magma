*ma-core
addDirectoryTree: aFileDirectory relativeTo: baseFileDirectory as: prefixString
	self
		addDirectoryTree: aFileDirectory
		relativeTo: baseFileDirectory
		as: prefixString
		if: [ : path | true ]