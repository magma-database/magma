private
recordLastKnownSizeOn: aMagmaCollectionReaderSegment to: endIndex ifBeyond: trunkEndPosition 
	trunk trunkSize = 0 
		ifTrue: 
			[ "empty, no possible results"
			aMagmaCollectionReaderSegment lastKnownSize: 0 ]
		ifFalse: 
			[ trunkEndPosition ifNotNil: 
				[ aMagmaCollectionReaderSegment lastKnownSize: (trunkEndPosition >= trunk trunkSize ifTrue: [ endIndex ]) ] ]