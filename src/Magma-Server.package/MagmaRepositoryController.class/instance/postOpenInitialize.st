private
postOpenInitialize
	self
		initializeSystemReadStrategy ;
		materializeClassDefinitions ;
		connect ;
		refreshView "so more classes will be pulled from unusedDepths of the SystemReadStrategy".
	repository initializeMagmaStatClassIds.
	OpenControllers add: self