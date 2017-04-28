test high-availability function
verifyHaFunctionality
	self
		verifyAddToNode ;
		verifyPrimaryFailure ;
		verifyRestartFormerPrimary ;
		verifyQuickSwapFunction ;
		verifyNodeCanMaintain ;
		verifySecondaryFailure