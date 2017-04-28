private
addChangesFromReadSet
	| truncateds |
	truncateds := OrderedCollection new.
	readSet keysAndValuesDo: 
		[ : eachCurrent : eachBuffer | 
		| didChange |
		eachCurrent ifNotNil: 
			[ didChange := self 
				didChange: eachCurrent
				from: eachBuffer.
			didChange ifTrue: 
				[ (session serializer isTruncated: eachCurrent) ifTrue: 
					[ (truncateds ifNil: [ truncateds := OrderedCollection new ]) add: eachCurrent ].
				commitPackage addObject: eachCurrent ] ] ].
	self warnOfTruncationsIn: truncateds