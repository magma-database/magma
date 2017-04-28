private
loadCode

	self new
		loadOldVersionsOfAllClassesInAllClients;
		remotePerform: #removeDomainClasses in: 'server'