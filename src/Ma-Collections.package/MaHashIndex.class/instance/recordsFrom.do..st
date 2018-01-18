SUnit tests
recordsFrom: aMaHashIndexRecord do: twoArgBlock 
	guard critical: 
		[ | childRec |
		aMaHashIndexRecord 
			byteArrayIndexesFrom: 0
			do: 
				[ : eachBax | 
				(aMaHashIndexRecord hasChildAtByteArrayIndex: eachBax) ifTrue: 
					[ childRec := aMaHashIndexRecord independentCopy.
					self 
						readRecord: childRec
						at: (aMaHashIndexRecord recordNumberAtByteArrayIndex: eachBax).
					twoArgBlock 
						value: aMaHashIndexRecord
						value: childRec.
					self 
						recordsFrom: childRec
						do: twoArgBlock ] ] ]