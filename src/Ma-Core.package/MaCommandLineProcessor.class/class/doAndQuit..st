api
doAndQuit: aBlock 
	self
		do: aBlock
		snapshotAs: nil
		andQuit: true