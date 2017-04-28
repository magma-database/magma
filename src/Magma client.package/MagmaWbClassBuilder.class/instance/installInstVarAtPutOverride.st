as yet unclassified
installInstVarAtPutOverride
	self shouldOverrideInstVarAtPut ifTrue:
		[ class compileSilently:
			'instVarAt: aNumber put: anObject
				| shouldSignal |
				shouldSignal := (super instVarAt: aNumber) ~~ anObject.
				shouldSignal ifTrue: [ self writeBarrier aboutToModify: self ].
				super instVarAt: aNumber put: anObject.
				shouldSignal ifTrue: [ self writeBarrier modified: self ]'
				classified: 'standard' ]