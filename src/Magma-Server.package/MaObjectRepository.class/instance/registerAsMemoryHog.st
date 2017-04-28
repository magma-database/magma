initialize-release
registerAsMemoryHog
	(Smalltalk memoryHogs includes: self) ifFalse: [ Smalltalk memoryHogs add: self ]