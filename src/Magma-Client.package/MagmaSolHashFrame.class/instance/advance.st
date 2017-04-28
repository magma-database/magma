overriding
advance
	"next will almost always be a proxy, so we avoid the DNU cost with this override."
	prev := curr.
	curr := next.
	next := next ifNotNil: [ next realObjectIfMutatingProxy next ]