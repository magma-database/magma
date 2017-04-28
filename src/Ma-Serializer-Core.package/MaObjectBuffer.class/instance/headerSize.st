private
headerSize
	"The number of bytes in each object record before its 'data' begins; the objects it references."
	^self bpMap headerSize