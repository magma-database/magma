private
set: aSOLHashNode
	prev := aSOLHashNode.
	curr := prev next.
	next := curr ifNotNil: [ curr next ]