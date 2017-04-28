overriding
set: aSOLHashNode
	"next will almost always be a proxy, so we avoid the DNU cost with this override."
	prev := aSOLHashNode.
	curr := prev next.
	next := curr ifNotNil: [ curr realObjectIfMutatingProxy next ]