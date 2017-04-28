bucket iterations
skipFree
	| n |
	n := next.
	[ n notNil and: [ n isFree ] ] whileTrue: [ n := n next ].
	^ next := n.
	