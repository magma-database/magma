accessing
upTo: countInteger startingAt: startInteger

	| answer size targetX |
	size := self size.
	startInteger > size ifTrue: [ ^ #() ].
	answer := Array new: (countInteger min: size-startInteger+1).
	targetX := 0.
	startInteger to: (startInteger+countInteger-1 min: size) do:
		[ : sourceX |
		answer
			at: (targetX := targetX + 1)
			put: (self at: sourceX) ].
	^ answer