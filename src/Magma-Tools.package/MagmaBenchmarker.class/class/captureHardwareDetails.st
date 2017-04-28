hardware info
captureHardwareDetails
	| answer |
	[ answer := UIManager default
		request: 'Please enter a brief description of your hardware separated by commas ' , self hardwareAttributes
		initialAnswer: (HardwareInfo ifNil: [ '' ]).
	(answer subStrings: ',') size < (self hardwareAttributes subStrings: ',') size ] whileTrue: [ self inform: 'All of those things are important, please enter them all.' ].
	^ answer