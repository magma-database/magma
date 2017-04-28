client/server required methods
processRequest: aMagmaRepositoryRequest 
	aMagmaRepositoryRequest repositoryController: self.
	^ [ self requestCritical: [ aMagmaRepositoryRequest process ] ] 
		on: Error
		do: 
			[ : anError | 
			self maMarked: 'dev'.	"This error routine must be improved.  It needs to log and notify for unhandled errors!"
			(MagmaPreferences debug and: 
				[ ({ 
					MagmaCommitConflictError.
					MagmaSessionLost.
					MagmaWrongCommitNumber.
					MagmaWrongServerError.
					MagmaAlreadyInTransaction 
				 } includes: anError maOriginalClass) not and: 
					[ anError isMaUserError not and: [ SmalltalkImage current maIsHeadless not ] ] ]) ifTrue: [ self halt: anError messageText ].
			anError ]