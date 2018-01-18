*ma-serializer-core
fixForWriteBarrier
	"When using the Compiler to evaluate an expression for an object which is behind write-barrier, be sure the last literal of the CM is the Association for the receiver's *original* class, so that we don't put a class name ending with '*' into the classDefinitions."
	| lit |
	(lit := self literalAt: self numLiterals) in:
		[ : assoc | (assoc isVariableBinding and: [ assoc value isBehavior ]) ifTrue:
			[ | originalClass |
			originalClass := assoc value theNonWriteBarrierClass.
			[ lit
				 key: originalClass name ;
				 value: originalClass ]
				on: AttemptToWriteReadOnlyGlobal
				do: [ : err | err resume: true ] ] ]