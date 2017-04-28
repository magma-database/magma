*magma server
repositoryController: aMagmaRepositoryController
	"Use this constructor only for *additional* local connections, i.e., two or more sessions connected to the same local repository.  Use the same MagmaRepositoryController you used to create the original."

	^ self link: (self newLocalLinkFor: aMagmaRepositoryController)