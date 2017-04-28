debugging
fileIn: aDirectoryEntryFile 
	^ aDirectoryEntryFile containingDirectory 
		maFileNamed: aDirectoryEntryFile name
		do: 
			[ : stream | 
			stream binary.
			self objectFromStream: stream ]