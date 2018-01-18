access
instVarsDoWithIndex: twoArgBlock

	1
		to: self objectInstSize
		do:
			[ :index |
			twoArgBlock
				value: (self maInstVarAt: index)
				value: index ]
