capture context
writeHardwareInformationTo: aStream

	aStream
		cr ; cr ;
		nextPutAll: 'Hardware Details:'.
	(self class hardwareAttributes subStrings: ',') with: (self class hardwareInfo subStrings: ',') do:
		[ : eachAttribute : eachValue |
		self
			writeEntry: eachAttribute
			value: eachValue
			to: aStream ]