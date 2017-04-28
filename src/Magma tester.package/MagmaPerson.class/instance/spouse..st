building
spouse: aMagmaPerson

	spouse := aMagmaPerson.
	aMagmaPerson spouse == self ifFalse: [ aMagmaPerson spouse: self ]
