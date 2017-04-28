*magma-server-accessing
newServerLink
	^ MagmaSession newLocalLinkFor: (MagmaRepositoryController openedOn: self)