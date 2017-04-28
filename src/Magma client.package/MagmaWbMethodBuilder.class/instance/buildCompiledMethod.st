private
buildCompiledMethod

"I was going to use this to try to capture index key-changes, but it turns out that is a flawed concept (see WhyNoChangedKeyAutoDetection.jpg).
	
	Still, I decided to keep the code for preNotifying around since it might come in useful in the future."

	^ super buildCompiledMethod

"
	generator := BytecodeGenerator new numArgs: selector numArgs.
	self generateStoreFields.
	self generatePreNotification.
	self generateCallSuper.
	self generateCheckFields.
	self generateReturn.
	self generateNotification.
	self generateReturn.
	^ generator compiledMethod
"