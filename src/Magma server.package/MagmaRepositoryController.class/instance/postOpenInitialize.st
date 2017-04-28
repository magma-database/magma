private
postOpenInitialize
	self
		initializeSystemReadStrategy ;
		materializeClassDefinitions ;
		connect ;
		refreshView "so more classes will be pulled from unusedDepths of the SystemReadStrategy".
	OpenControllers add: self