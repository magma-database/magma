private
deleteApplyFile
	applyFile ifNotNil: [ applyFile close ].
	self directory deleteFileNamed: self class applyFilename