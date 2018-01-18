*ma-core
registerSelfAsFileReader
	(FileServices registeredFileReaderClasses includes: self) ifFalse: [ FileServices registerFileReader: self ]