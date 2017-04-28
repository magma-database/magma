*magma-server-private
newLocalLinkFor: aMagmaRepositoryController

	^ MaLocalServerLink localRequestServer: (MaLocalRequestServer processor: aMagmaRepositoryController)