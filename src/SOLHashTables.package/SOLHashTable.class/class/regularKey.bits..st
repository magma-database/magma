key-construction
regularKey: frwdKey bits: bits 
	"Construct a regular list node key from a hash segment key."
	^ (frwdKey bitReverse: bits) bitOr: 1