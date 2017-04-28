private
populateLiteralsFor: aCompiledMethod using: aMaObjectSerializer 
	1
		to: aCompiledMethod numLiterals
		do:
			[ : index | 
			self
				maInstVarAt: index
				put: (aMaObjectSerializer oidFor: (aCompiledMethod literalAt: index)) ]