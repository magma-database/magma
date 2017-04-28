notifications
noteTimeToLoadBuffers: milliseconds 
	"The number of milliseconds spent compressing and uncompressing ByteArrays for more efficient network transport."
	self statistics timeToLoadBuffersHistory addValue: milliseconds