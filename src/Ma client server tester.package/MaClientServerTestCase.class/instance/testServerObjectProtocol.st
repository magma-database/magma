shared
testServerObjectProtocol
	^ { 
		MacsTestRequest.
		DateAndTime.
		Duration.
		Association.
		UUID.
		"String not needed, it is supported automatically."
		MacsTestResponse
	 }