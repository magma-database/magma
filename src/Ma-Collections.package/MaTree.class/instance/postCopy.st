copying
postCopy
	"Private - use Copy"
	| newChildren |
	parents := parents copy.
	newChildren := children class new.
	children keysAndValuesDo:
		[ : eachNode : eachChildren |
		newChildren at: eachNode put: eachChildren copy ].
	children := newChildren