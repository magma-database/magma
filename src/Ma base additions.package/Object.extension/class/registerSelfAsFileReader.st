*ma base additions
registerSelfAsFileReader
	(FileServices registeredFileReaderClasses includes: self) ifFalse: [ FileServices registerFileReader: self ]