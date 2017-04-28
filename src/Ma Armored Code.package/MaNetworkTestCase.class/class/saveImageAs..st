other squeak images
saveImageAs: fileNameString

	SmalltalkImage current 
		closeSourceFiles ;
		saveChangesInFileNamed: (SmalltalkImage current fullNameForChangesNamed: fileNameString) ;
		saveImageInFileNamed: (SmalltalkImage current fullNameForImageNamed: fileNameString)