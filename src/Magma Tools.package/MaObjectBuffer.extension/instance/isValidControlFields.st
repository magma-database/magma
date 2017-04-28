*magma tools
isValidControlFields
	"The 4 high-order bits should be 0, since they're not used."
	| withZeroedLowOrderBits |
	withZeroedLowOrderBits := self controlFields >> 4 << 4.
	^ withZeroedLowOrderBits = 0