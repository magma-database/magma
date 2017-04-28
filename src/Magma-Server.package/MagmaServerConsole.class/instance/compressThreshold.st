accessing
compressThreshold
	"Compressing large responses can make a significant performance improvement on slow networks.  Compression makes things worse with small responses or on really fast networks.  Answer the number of bytes a response needs for compression to occur."
	^ server ifNotNil: [ server compressThreshold ]