private
buildCompiledMethod
	self
		 generateSignature ;
		 generateTemporaryDeclarations ;
		 generateStoreFields ;
		 generateCallSuper ;
		 generateCheckFields ;
		 generateReturn.
	class
		compileSilently: stream contents
		classified: 'overriding'.
	^ class methodDictionary at: selector