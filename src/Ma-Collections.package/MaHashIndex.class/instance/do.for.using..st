SUnit tests
do: aBlock for: aMagmaFileTraverser using: aMaReadStrategy

	self
		entriesFromIndex: 1
		do:
			[ :eachRecord :recordPosition :levels |
			aMagmaFileTraverser
				graphFrom: (eachRecord keyAtByteArrayIndex: recordPosition)
				do: aBlock
				using: aMaReadStrategy ]
		until:
			[ :eachRecord :recordPosition :levels | false ]
