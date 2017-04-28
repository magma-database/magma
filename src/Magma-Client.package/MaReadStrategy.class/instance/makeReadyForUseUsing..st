private
makeReadyForUseUsing: aMaClassIdManager 
	self
		resetDepths ;
		convertSpecificationsToIdsUsing: aMaClassIdManager ;
		inheritDeeperDepthsUsing: aMaClassIdManager ;
		unspecifiedClassesInheritUsing: aMaClassIdManager