*magma client
refreshedFromMagma: aMagmaRefreshEvent

	aMagmaRefreshEvent hasRestoreData
		ifTrue:
			[ (aMagmaRefreshEvent restoreData at: #owner)
				addMorph: self
				asElementNumber: (aMagmaRefreshEvent restoreData at: #index).
			owner isWorldMorph
				ifTrue: 
					[ owner startSteppingSubmorphsOf: self ]
				ifFalse:
					[ (aMagmaRefreshEvent restoreData at: #wasStepping)
						ifTrue: [ self startStepping ] ] ]