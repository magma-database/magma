private
prewriteAdjustmentTo: bufferToWrite from: persistentBuffer
	bufferToWrite classId = MagmaClassIdManager magmaCounterClassId 
		ifTrue:
			[ | sharedValue delta |
			"These inst-var indices match MagmaCounter; hard-coded for maximum performance."
			sharedValue := persistentBuffer
				ifNil: [ "A brand new counter" 0 ]
				ifNotNil: [ MaOidCalculator integerFromOid: (persistentBuffer maInstVarAt: 1) ].
			delta := MaOidCalculator integerFromOid: (bufferToWrite maInstVarAt: 2).
			(sharedValue+delta) > 1073741823 ifTrue: [ MagmaStatOverflowCommitError signal ].
			bufferToWrite

				maInstVarAt: 1
				put: (MaOidCalculator oidForInteger: sharedValue + delta) ;

				maInstVarAt: 2
				put: (MaOidCalculator oidForInteger: 0) ]
		ifFalse:
			[ (magmaStatClassIds includes: bufferToWrite classId) ifTrue:
				[ | sharedCount deltaCount sharedSum deltaSum sharedMin sharedMax |
				"These inst-var indices match MagmaStat; hard-coded for maximum performance."
				persistentBuffer
					ifNil: 
						[ "A brand new stat" 
						sharedCount := 0.
						sharedSum := 0.0.
						sharedMin := Float infinity.
						sharedMax := Float infinity negated ]
					ifNotNil: 
						[ sharedCount := MaOidCalculator integerFromOid: (persistentBuffer maInstVarAt: 2).
						sharedSum := MaOidCalculator floatFromOid: (persistentBuffer maInstVarAt: 3).
						sharedMin := MaOidCalculator floatFromOid: (persistentBuffer maInstVarAt: 4).
						sharedMax := MaOidCalculator floatFromOid: (persistentBuffer maInstVarAt: 5) ].
				deltaCount := MaOidCalculator integerFromOid: (bufferToWrite maInstVarAt: 7).
				sharedCount + deltaCount >  1073741823 "SmallInteger maxVal" ifTrue: [ MagmaStatOverflowCommitError signal ].
				deltaSum := MaOidCalculator floatFromOid: (bufferToWrite maInstVarAt: 8).
				bufferToWrite

					maInstVarAt: 2 "count"
					put: (MaOidCalculator oidForInteger: (sharedCount+deltaCount)) ;

					maInstVarAt: 3 "sum"
					put: (MaOidCalculator oidForFloat: sharedSum + deltaSum) ;

					maInstVarAt: 4 "min"
					put: (MaOidCalculator oidForFloat: (sharedMin min: (MaOidCalculator floatFromOid: (bufferToWrite maInstVarAt: 4)))) ;

					maInstVarAt: 5 "max"
					put: (MaOidCalculator oidForFloat: (sharedMax max: (MaOidCalculator floatFromOid: (bufferToWrite maInstVarAt: 5)))) ;

					"The 'last' variable in bufferToWrite wins over the one in persistentBuffer."

					maInstVarAt: 7  "deltaCount -- make it 0 so that's how it'll be read by clients."
					put: (MaOidCalculator oidForInteger: 0) ;

					maInstVarAt: 8  "deltaSum -- make it 0 so that's how it'll be read by clients."
					put: (MaOidCalculator oidForFloat: 0.0) ] ]