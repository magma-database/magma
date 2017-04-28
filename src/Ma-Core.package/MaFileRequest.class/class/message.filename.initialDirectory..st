create
message: aString filename: filenameString initialDirectory: aFileDirectory

	^ self new
		messageText: aString, '.  Where is ', filenameString, '?' ;
		initialAnswer: aFileDirectory fullName ;
		yourself