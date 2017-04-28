private
traverseSlotsFromRecord: aMaHashIndexRecord index: entryIndex do: threeArgBlock until: conditionBlock level: levelInteger
	"levelInteger is 1 for the root record."

	| done |

	done :=
		self
			traverseSlotsFromParentRecord: aMaHashIndexRecord
			index: entryIndex
			do: threeArgBlock
			until: conditionBlock
			level: levelInteger.
	(done not and: [ levelInteger > 1 ])
		ifTrue:
			[ | nextStart |
			nextStart := recordFactory recordAtLevel: levelInteger - 1.
			self
				readRecord: nextStart
				at: (recordFactory recordNumberAtLevel: levelInteger - 1).
			self
				traverseSlotsFromRecord: nextStart
				index: (recordFactory entryIndexAtLevel: levelInteger - 1) + 1
				do: threeArgBlock
				until: conditionBlock
				level: levelInteger - 1 ]
