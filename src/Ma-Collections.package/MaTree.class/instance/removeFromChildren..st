private
removeFromChildren: anObject 
	(children at: (self parentOf: anObject)) remove: anObject