access
bpMapIndex: anInteger 
	"Set my bpMapIndex to a value between 0 and 15."
	| shifted |
	shifted := anInteger bitShift: 4.
	self controlFields: (shifted bitOr: self type)