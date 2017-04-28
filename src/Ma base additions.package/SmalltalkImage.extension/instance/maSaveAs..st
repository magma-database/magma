*ma base additions
maSaveAs: newName 
	"Save the image  under that new name."
	newName ifNil: [ ^ self ].
	(SourceFiles at: 2) ifNotNil: 
		[ self
			closeSourceFiles ;
			saveChangesInFileNamed: (self fullNameForChangesNamed: newName)	"so copying the changes file will always work" ].
	self saveImageInFileNamed: (self fullNameForImageNamed: newName)