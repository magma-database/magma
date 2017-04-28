overriding
readInto: aByteArray at: recordIndex 
	"Since records can be 0-based (sigh), we +1 the recordIndex."
	aByteArray 
		replaceFrom: 1
		to: aByteArray size
		with: (records at: recordIndex + 1)
		startingAt: 1