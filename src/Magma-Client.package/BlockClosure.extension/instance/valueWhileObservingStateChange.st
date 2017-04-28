*magma-client
valueWhileObservingStateChange
	"Handle the situation where the user used commit: [ someInstVar := somevalue].  In that case, the commit happens in the super call of WB before it had a chance to compare and send #modified:."
	| receiver preState result |
	receiver := self home receiver.
	(receiver isBehindWriteBarrier not or: [ receiver class instSize isZero ]) ifTrue: [ ^ self value ].
	preState := receiver shallowCopy.
	result := self value.
	1
		to: receiver class instSize
		do:
			[ : varIndex | ((receiver slotAt: varIndex) ~~ (preState slotAt: varIndex) and: [ (receiver maIsTransient: varIndex) not ]) ifTrue:
				[ receiver writeBarrier modified: receiver.
				^ result ] ].
	^ result