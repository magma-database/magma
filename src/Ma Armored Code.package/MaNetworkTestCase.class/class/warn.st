private
warn
	Warning signal: (String streamContents: 
			[ : stream | 
			stream
				maPrint: 'You are about to kick off network test cases.  To simulate a client-server environment, the suite runs in separate images.  Each of the images is created automatically by saving four copies of this image and its changes file.  One to host the server, one for each client, and one known as the "conductor" image, sends instructions to the others in order to execute the test.

This image is about to be saved under a different name ("' ;
				maPrint: self conductorImageFilename ;
				maPrint: '") and launch a test-suite.  It is therefore recommended to save this image (under its current name) to capture your work before proceeding.		
' ])