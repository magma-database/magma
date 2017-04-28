key-construction
regularKey32: frwdKey
	"Construct a regular list node key from a hash segment key."

	^(self bitReverse32: frwdKey) bitOr: 1