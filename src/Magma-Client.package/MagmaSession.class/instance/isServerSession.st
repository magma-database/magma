private
isServerSession
	^ (Smalltalk hasClassNamed: #MagmaRepositoryController) and: 
		[ self userId = (Smalltalk classNamed: #MagmaRepositoryController) systemSessionUserId ]