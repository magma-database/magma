debugging
keyCollisions
	"Return the number of key collisions in the receiver."
	| num prevKey currKey |
	num := 0.
	prevKey := 0.
	currKey := 0.
	self allNodesDo:
	    [ :node |
			(node dummy) ifFalse:
			    [currKey := node key.
				(prevKey = currKey) ifTrue:
				    [num := num + 1]
				ifFalse:
				    [prevKey := currKey]]].
	^num