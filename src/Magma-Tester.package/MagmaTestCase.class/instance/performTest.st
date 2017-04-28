private
performTest
	super performTest.
	
	[ self
		initiateBackupIfTime ;
		verifyRestoreIfTime ] 
		on: MaNotification
		do: 
			[ : n | 
			Transcript
				cr ;
				show: n messageText.
			n resume ]