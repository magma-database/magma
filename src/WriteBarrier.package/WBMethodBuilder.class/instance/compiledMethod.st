access
compiledMethod
	^ Cache at: (class lookupSelector: selector) ifAbsentPut: [self buildCompiledMethod]