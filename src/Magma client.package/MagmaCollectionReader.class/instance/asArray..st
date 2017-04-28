converting
asArray: count 
	"Answer an Array of up to count elements contained in me."
	| a |
	a := Array new: (count min: self lastKnownSize).
	self withIndexDo: 
		[ : each : x | 
		a 
			at: x
			put: each.
		x = count ifTrue: [ ^ a ] ].
	^ a