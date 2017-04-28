initialize-release
unregisterAsMemoryHog
	Smalltalk memoryHogs 
		remove: self
		ifAbsent: 
			[ "just making sure"
			 ]