client/server required methods
processRequest: aMagmaRepositoryRequest 
	aMagmaRepositoryRequest repositoryController: self.
	^ [ self requestCritical:
		[ | result |
		result := aMagmaRepositoryRequest process.
		repository freeSomeSpaceIfNecessary: aMagmaRepositoryRequest sessionId.
		result ] ]
		on: Error
		do:
			[ : anError | self maMarked: 'dev'.
			"This error routine must be improved.  It needs to log and notify for unhandled errors!"
			(MagmaPreferences debug and:
				[ ({MagmaCommitConflictError. 
				MagmaSessionLost. 
				MagmaWrongCommitNumber. 
				MagmaWrongServerError. 
				MagmaAlreadyInTransaction} includes: anError maOriginalClass) not and:
					[ anError isMaUserError not and: [ Smalltalk isHeadless not ] ] ]) ifTrue: [ anError pass ].
			anError ]