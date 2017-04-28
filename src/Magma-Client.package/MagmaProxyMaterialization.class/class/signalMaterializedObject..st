signaling
signalMaterializedObject: anObject 
	(self new)
		messageText: 'materializing a ' , anObject maOriginalClass printString;
		materializedObject: anObject;
		signal