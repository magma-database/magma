building
repositoryController: aMaRepositoryController

	repositoryController := aMaRepositoryController.
	aMaRepositoryController repository == self ifFalse: [ aMaRepositoryController repository: self ]
