private
traverseSlotsFromParentRecord: aMaHashIndexRecord index: entryIndex do: threeArgBlock until: conditionBlock level: levelInteger
	"levelInteger is 1 for the root record."

	| conditionMet |

	conditionMet := false.
	aMaHashIndexRecord
		byteArrayIndexesFrom: entryIndex
		do:
			[ :index | | nextToRead |
			conditionMet
				ifFalse:
					[ nextToRead := aMaHashIndexRecord recordNumberAtByteArrayIndex: index.
					(conditionBlock
						value: aMaHashIndexRecord
						value: index
						value: levelInteger)
							ifTrue:
								[ conditionMet := true ]
							ifFalse:
								[ threeArgBlock
									value: aMaHashIndexRecord
									value: index
									value: levelInteger ] ].
			conditionMet
				ifFalse:
					[ nextToRead > 0
						ifTrue:
							[ | currentRecord |
							currentRecord := recordFactory recordAtLevel: levelInteger + 1.
							self
								readRecord: currentRecord
								at: nextToRead.
							conditionMet :=
								self
									traverseSlotsFromParentRecord: currentRecord
									index: 0
									do: threeArgBlock
									until: conditionBlock
									level: levelInteger + 1 ] ] ].
	^conditionMet
