private
trackSize
	"This is the minimum number of bytes to read from disk for any object.
	This particular value allows up to 32 instVars to be read at once."

	"^MaAbstractObjectBuffer addressSize * 32 + MaNormalObjectBuffer headerSize"
	^280 "same as above, but faster.."