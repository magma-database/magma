file
openApplyFile
	applyFile ifNil: [ applyFile := self directory fileNamed: self class applyFilename ].
	applyFile
		binary ;
		position: 0