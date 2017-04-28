test class schema upgrades
loadOldVersionsOfAllClassesInAllClients
	self
		ensureNoContactMethodsAttribute ;
		pushClass: (Smalltalk classNamed: #MagmaContact) ;
		pushClass: (Smalltalk classNamed: #MagmaPerson)