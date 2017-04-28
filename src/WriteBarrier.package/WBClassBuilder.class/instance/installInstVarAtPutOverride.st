private
installInstVarAtPutOverride
	self shouldOverrideInstVarAtPut ifTrue:
		[ class compileSilently:
			'instVarAt: aNumber put: anObject
				| shouldSignal result |
				shouldSignal := (super instVarAt: aNumber) ~~ anObject.
				result := super instVarAt: aNumber put: anObject.
				shouldSignal ifTrue: [ self writeBarrier modified: self ].
				^ result'
				classified: 'standard' ]