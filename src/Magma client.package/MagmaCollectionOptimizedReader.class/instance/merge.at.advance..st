private
merge: oneArgBlock at: hashKey advance: anInteger 
	| containingSegment |
	containingSegment := self segmentSpanningKey: hashKey.
	containingSegment 
		ifNil: 
			[ hashKey < segment lowestKey 
				ifTrue: [ segment advanceStart: 1 ]
				ifFalse: 
					[ "We already know it doesn't span hashKey, but if it is beyond, then increment the lastKnownsize."
					hashKey > segment highestKey ifTrue: [ segment advanceLastKnownSize: anInteger ] ] ]
		ifNotNil: 
			[ oneArgBlock value: containingSegment.
			segment advanceEnd: anInteger ]