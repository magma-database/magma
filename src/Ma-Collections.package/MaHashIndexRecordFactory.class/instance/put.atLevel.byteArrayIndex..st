building
put: aMaHashIndexRecord atLevel: levelInteger byteArrayIndex: indexInteger

	levelInteger > recordNumbersPath size
		ifTrue:
			[ recordNumbersPath add: aMaHashIndexRecord recordNumber.
			byteArrayIndexPath add: indexInteger.
			entryIndexPath add: (aMaHashIndexRecord slotIndexForBax: indexInteger) ]
		ifFalse:
			[ recordNumbersPath
				at: levelInteger
				put: aMaHashIndexRecord recordNumber.
			byteArrayIndexPath
				at: levelInteger
				put: indexInteger.
			entryIndexPath
				at: levelInteger
				put: (aMaHashIndexRecord slotIndexForBax: indexInteger) ].
	levelInteger > recordPath size
		ifFalse:
			[ (recordPath at: levelInteger) populateFrom: aMaHashIndexRecord ]
