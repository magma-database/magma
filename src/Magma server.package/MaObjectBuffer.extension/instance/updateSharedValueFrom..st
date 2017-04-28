*magma server
updateSharedValueFrom: existingObjectBuffer 
	"These inst-var indices match MagmaCounter; hard-coded for maximum performance."
	| shared delta |
	shared := existingObjectBuffer 
		ifNil: [ "A brand new counter" 0 ]
		ifNotNil: 
			[ MaOidCalculator integerFromOid: (existingObjectBuffer maInstVarAt: 1) ].
	delta := MaOidCalculator integerFromOid: (self maInstVarAt: 2).
	self 
		maInstVarAt: 1
		put: (MaOidCalculator oidForInteger: shared + delta).
	self 
		maInstVarAt: 2
		put: (MaOidCalculator oidForInteger: 0)