private
resetReadStrategy
	"We allow the user to define read strategies 'specifications' for classes that may not even exist in the repository.  So, classes that aren't known yet are remembered by the strategy."
	^ guard critical: 
		[ readStrategy 
			ifNotNil: 
				[ readStrategy isNew ifTrue: 
					[ "do we have new depth specifications?"
					"Must ensureConnected now instead of relying on a lazy connection because #resetReadStrategy copies my readStrategy.  We need the ReadStrategy *after* we have downloaded the class-definitions."
					self ensureConnected.
					[ readStrategy copyWithoutSpecifications ] ensure: [ readStrategy beOld ] ] ] ]