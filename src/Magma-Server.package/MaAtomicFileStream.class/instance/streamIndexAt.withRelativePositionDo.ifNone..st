private
streamIndexAt: filePosition withRelativePositionDo: twoArgBlock ifNone: aBlock
	"Value twoArgBlock with the index of the fileStream that contains filePosition, and the relative position within that fileStream that matches filePosition."
	| runningSize |
	runningSize := 0.
	sizes withIndexDo: 
		[ : eachSize : index | 
		filePosition < (runningSize + eachSize) ifTrue: 
			[ | relativePosition |
			relativePosition := filePosition - runningSize.
			^ twoArgBlock 
				value: index
				value: relativePosition ].
		runningSize := runningSize + eachSize ].
	"filePosition is Beyond end of last fileStream."
	^ aBlock value