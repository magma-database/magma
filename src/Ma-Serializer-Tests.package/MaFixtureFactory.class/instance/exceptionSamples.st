private non-collection samples
exceptionSamples
	^ { Error new messageText: 'sample error'.
	Warning new messageText: 'sample warning'.
	Notification new messageText: 'sample notification' }