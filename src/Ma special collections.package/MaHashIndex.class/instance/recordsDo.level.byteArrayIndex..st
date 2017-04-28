SUnit tests
recordsDo: twoArgBlock level: level byteArrayIndex: anInteger 
	guard critical: 
		[ | parent |
		recordFactory 
			put: record
			atLevel: level
			byteArrayIndex: anInteger.
		parent := recordFactory recordAtLevel: level.
		twoArgBlock 
			value: parent
			value: level.
		parent 
			byteArrayIndexesFrom: 0
			do: 
				[ : eachBax | 
				(parent hasChildAtByteArrayIndex: eachBax) ifTrue: 
					[ self selectRecord: (parent recordNumberAtByteArrayIndex: eachBax).
					self 
						recordsDo: twoArgBlock
						level: level + 1
						byteArrayIndex: anInteger ] ] ]