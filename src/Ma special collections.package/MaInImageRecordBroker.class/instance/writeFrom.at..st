overriding
writeFrom: aByteArray at: recordIndex 
	[ records size < (recordIndex + 1) ] whileTrue: [ records add: nil ].
	records 
		at: recordIndex + 1
		put: aByteArray copy