initialize-release
initializeSpecialOidsList
	"See MagmaSession>>#handleSpecialOidNotifications:"
	| classDefinitions session |
	classDefinitions := repositoryController definition classDefinitions.
	session := self session.
	(session isPersistent: classDefinitions) ifTrue: 
		[ transactionLog
			onChangeOf: (self session oidFor: repositoryController definition classDefinitions)
				clientsShould: #refreshClassDefinitions ;
			onChangeOf: (self session oidFor: self node)
				clientsShould: #refreshNode ]