test class schema upgrades
commitInitialMagmaPerson
	| session |
	session := self newSessionAt: self class magmaServerLocation.
	session connect: (MagmaUser id: 'conductor').
	session commit: 
		[ session root 
			at: 'testClassSchemaUpgrades'
			put: (MagmaPerson new
					name: 'Mayer' ;
					yourself) ].
	session disconnect