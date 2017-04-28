private
installAtPutOverrides
	self shouldOverrideAtPut ifTrue:
		[class compileSilently:
			'at: aNumber put: anObject
				| shouldSignal result |
				shouldSignal := (super at: aNumber) ~~ anObject.
				result := super at: aNumber put: anObject.
				shouldSignal ifTrue: [ self writeBarrier modified: self ].
				^ result'
				classified: 'standard']

