access
type: anInteger 
	| controlFieldsValue withZeroedBits |
	controlFieldsValue := self controlFields.
	"Zero out 4 lowest-order bits, that's where this field is stored."
	withZeroedBits := controlFieldsValue >> 4 << 4.
	"Now OR these bits with anInteger."
	self controlFields: (withZeroedBits bitOr: anInteger)