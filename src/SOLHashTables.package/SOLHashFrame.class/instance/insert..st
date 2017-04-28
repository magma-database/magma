private
insert: newNode
	"Insert newNode between prev and curr and return the inserted node"

	"Make a sanity check to see we don't ever insert a double dummy."
	"
	(newNode dummy) ifTrue:
	    [((prev key) = (newNode key)) ifTrue: [self halt].
		((nil ~= curr) and: [(curr key) = (newNode key)]) ifTrue: [self halt]].
	"
	newNode next: curr.
	prev next: newNode.
	^newNode