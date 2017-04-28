accessing
conflictingObjectsDo: aBlock 
	commitConflicts do:
		[ : each | each conflictingObjects do: aBlock ]