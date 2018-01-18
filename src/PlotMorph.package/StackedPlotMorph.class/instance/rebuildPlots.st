private
rebuildPlots
	submorphs do: [ : each | each delete ].
	plots withIndexDo:
		[ : each : plotIndex | each
			 hResizing: #spaceFill ;
			 vResizing: #spaceFill ;
			 layoutFrame:
				(LayoutFrame new
					 leftFraction: 0.0 ;
					 rightFraction: 1.0 ;
					 topFraction: (plotIndex - 1 / plots size) asFloat ;
					 bottomFraction: (plotIndex / plots size) asFloat ;
					 topOffset: (plotIndex>1 ifTrue: [2] ifFalse: [0]) ;
					 bottomOffset: (plotIndex< plots size ifTrue: [-2] ifFalse: [0])).
		self addMorphBack: each ].
	plots withIndexDo:
		[ : each : x | x < plots size ifTrue:
			[ self
				addPaneHSplitterBetween: each
				and: (Array with: (plots at: x+1)) ] ].
	plots do: [ : each | each changed ].
	self linkSubmorphsToSplitters