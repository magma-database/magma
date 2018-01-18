*ma-core
lzUncompressed
	"I am a ByteArray compressed with lzCompress.  Answer its original, uncompressed, form."
	| compressed |
	compressed := ReadStream on: self.
	^ (GZipReadStream on: compressed) contents