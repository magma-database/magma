private
value: aMagmaRepositoryRequest 
	"Make the console available too for network-serving repositories."
	^ 
	[ aMagmaRepositoryRequest
		console: self ;
		nodeCheck.
	controller value: aMagmaRepositoryRequest ] 
		on: Error
		do: 
			[ : anError | 
			self maMarked: 'dev'.	"This error routine must be improved.  It needs to log and notify for unhandled errors!"
			(MagmaPreferences debug and: 
				[ ({ 
					MagmaCommitConflictError.
					MagmaSessionLost.
					MagmaWrongServerError.
					MagmaWrongCommitNumber
				 } includes: anError maOriginalClass) not and: 
					[ anError isMaUserError not and: [ SmalltalkImage current maIsHeadless not ] ] ]) ifTrue: [ self halt: anError messageText ].
			anError ]