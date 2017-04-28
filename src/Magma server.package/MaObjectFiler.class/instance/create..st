private
create: aFileDirectory

	self
		directory: aFileDirectory assureExistence ;
		createDataFile ;
		createFilePositionIndex.
	^ self