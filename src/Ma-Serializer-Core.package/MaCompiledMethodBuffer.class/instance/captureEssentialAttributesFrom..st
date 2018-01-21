building
captureEssentialAttributesFrom: aCompiledMethod
	self
		byteCodesPlusTrailerSize: aCompiledMethod maBytesSize ;
		methodHeader: aCompiledMethod header ;
		spurHeader: Smalltalk vm isSpur