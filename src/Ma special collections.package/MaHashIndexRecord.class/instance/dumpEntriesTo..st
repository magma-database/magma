printing
dumpEntriesTo: aStream 
	self 
		byteArrayIndexesFrom: 0
		do: 
			[ : eachBax | 
			(self numberOfChildrenAtByteArrayIndex: eachBax) > 0 ifTrue: 
				[ | x |
				x := self slotIndexForBax: eachBax.
				aStream
					cr ;
					space ;
					space ;
					maPrint: 'x:' ;
					maPrint: x ;
					maPrint: ' [' ;
					maPrint: (self lowestKeyAtIndex: x) ;
					maPrint: '..' ;
					maPrint: (self highestKeyAtIndex: x) ;
					maPrint: ']' ;
					maPrint: ' bx:' ;
					maPrint: (self byteArrayIndexFor: x).
				(self hasSlotAvailableAtByteArrayIndex: eachBax) ifTrue: [ aStream nextPutAll: ' *empty slot* ' ].
				aStream
					maPrint: ' k:' ;
					maPrint: (self keyAtByteArrayIndex: eachBax) ;
					maPrint: ' v:' ;
					maPrint: (self valueAtByteArrayIndex: eachBax) ;
					maPrint: ' r:' ;
					maPrint: (self recordNumberAtByteArrayIndex: eachBax) ;
					maPrint: ' c:' ;
					maPrint: (self numberOfChildrenAtByteArrayIndex: eachBax) ;
					endEntry ] ]