public
add: anObject 
	anObject isBehindWriteBarrier
		ifTrue:
			[ anObject writeBarrier = self ifFalse: [ self error: 'This object is already behind another write barrier.' ] ]
		ifFalse:
			[ anObject isClosure
				ifTrue: [ self error: 'Should not add BlockClosure''s to a WriteBarrier.' ]
				ifFalse:
					[ anObject primitiveChangeClassTo: (self barrierClassForClass: anObject class) basicNew.
					self assert: anObject writeBarrier = self ] ]