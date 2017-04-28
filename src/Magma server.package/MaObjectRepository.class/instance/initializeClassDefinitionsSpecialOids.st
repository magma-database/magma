initialize-release
initializeClassDefinitionsSpecialOids
	"This collection of special oids can grow.  When it does, clients need to know about it."

	repositoryController definition classDefinitions do:
		[ : each |
		(repositoryController session isPersistent: each)
			ifTrue:
				[ transactionLog
					onChangeOf: (repositoryController session oidFor: each "OrderedCollection of definitions")
					clientsShould: #refreshClassVersions ] ]