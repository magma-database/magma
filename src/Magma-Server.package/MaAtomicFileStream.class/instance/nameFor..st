private
nameFor: fileIndex 
	"The name of the file numbered fileIndex."
	^ (FileDirectory default splitNameVersionExtensionFor: filename) in: 
		[ : nameNumberAndExtension | 
		String streamContents: 
			[ : stream | 
			stream
				maPrint: nameNumberAndExtension first ;
				nextPut: $. ;
				maPrint: fileIndex.
			nameNumberAndExtension last ifNotEmpty: 
				[ stream
					nextPut: $. ;
					maPrint: nameNumberAndExtension last ] ] ]