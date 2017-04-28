creation
open: aFileDirectory controller: aMaRepositoryController

	^self new
		repositoryController: aMaRepositoryController ;
		open: aFileDirectory ;
		yourself