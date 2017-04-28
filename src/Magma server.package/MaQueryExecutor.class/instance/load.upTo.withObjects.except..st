private
load: aMagmaCollectionSegment upTo: anInteger withObjects: aBoolean except: removedSet 
	"Load my segment with up to anInteger oids.  Since we load segments in succession, only capture the answer oids for the page that surrounds targetIndexInteger."
	| trunkEndPosition hitCount highestKey endIndex lowestKey |
	lowestKey := 1 bitShift: 4096.
	highestKey := hitCount := 0.
	trunkEndPosition := self 
		trunkFrom: aMagmaCollectionSegment trunkStart
		do: 
			[ : eachKey : eachOid | 
			(expression isClause or: 
				[ expression 
					shouldInclude: eachOid
					using: collectionManager ]) ifTrue: 
				[ highestKey := eachKey max: highestKey.
				lowestKey := eachKey min: lowestKey.
				(removedSet includes: eachOid) ifFalse: 
					[ hitCount := hitCount + 1.
					aBoolean ifTrue: [ aMagmaCollectionSegment addObject: eachKey -> eachOid ] ] ] ]
		until: [ hitCount = anInteger ].
	endIndex := aMagmaCollectionSegment startIndex + hitCount - 1.
	aMagmaCollectionSegment
		trunk: self trunk ;
		lowestKey: lowestKey ;
		highestKey: highestKey ;
		trunkEnd: trunkEndPosition.
	aMagmaCollectionSegment endIndex: endIndex.
	expression isClause 
		ifTrue: 
			[ aMagmaCollectionSegment lastKnownSize: trunk trunkSize ]
		ifFalse: 
			[ self 
				recordLastKnownSizeOn: aMagmaCollectionSegment
				to: endIndex
				ifBeyond: trunkEndPosition ]