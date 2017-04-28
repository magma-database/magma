private
recoverFinishedCores
	guard critical:
		[ cores withIndexDo:
			[ : each : x | each ifNotNil:
				[ (each isVariableBinding not and: [ each isReady not ]) ifTrue:
					[ each disconnect.
					cores
						at: x
						put: nil ] ] ] ]