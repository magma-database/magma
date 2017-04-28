*ma-core
occurrence: anInteger where: oneArgBlock startingAt: startPos 
	"Answer the position of the anInteger'th Character, aCharacter, in the receiver.  If not found, answer 0."
	| pos count |
	count := 0.
	pos := startPos.
	[ pos < self size and: [ count < anInteger ] ] whileTrue: 
		[ (oneArgBlock value: (self at: pos)) ifTrue: [ count := count + 1 ].
		pos := pos + 1 ].
	^ count = anInteger 
		ifTrue: [ pos-1 ]
		ifFalse: [ 0 ]