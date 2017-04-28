accessing
dummy
	"Return true if receiver is a dummy node."

	^0 = ((self key) bitAnd: 1)