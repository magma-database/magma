*magma server
newServerLink
	^ MagmaSession newLocalLinkFor: (MagmaRepositoryController openedOn: self)