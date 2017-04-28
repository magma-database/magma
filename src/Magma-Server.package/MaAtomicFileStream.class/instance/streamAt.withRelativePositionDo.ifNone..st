private
streamAt: filePosition withRelativePositionDo: twoArgBlock ifNone: aBlock 
	"Value twoArgBlock with the fileStream that contains filePosition, and the relative position within that fileStream that matches filePosition."
	^ self 
		streamIndexAt: filePosition
		withRelativePositionDo: 
			[ : index : relativePosition | 
			twoArgBlock 
				value: (fileStreams at: index)
				value: relativePosition ]
		ifNone: aBlock