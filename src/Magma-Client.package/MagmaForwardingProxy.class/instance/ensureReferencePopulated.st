serialization
ensureReferencePopulated
	magmaId ifNil: 
		[ cachedObject magmaSession 
			ifNil: 
				[ MagmaUserError signal: 'Remote object must be persistent before remote reference to them can be calculated.' ]
			ifNotNil: 
				[ : sess | 
				"Copy the target object's magmaId, so we don't share instances between sessions.  MagmaCommitPackage will ensureCanonicalizedMagmaId:."
				magmaId := sess magmaId veryDeepCopy.
				magmaId ifNil: [ MagmaSoftwareError signal: 'Expected session to have definition' ].
				oid := sess oidFor: cachedObject ].
		(MaOidCalculator isOidForNewObject: oid) ifTrue: 
			[ MagmaSoftwareError signal: 'Expected cachedObject to be persistent at this point.' ] ]