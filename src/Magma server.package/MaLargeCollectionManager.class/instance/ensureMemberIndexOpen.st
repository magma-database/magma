initializing
ensureMemberIndexOpen
	memberIndex ifNil:
		[ memberIndex := self openIndex: (repository collectionFilenameFor: collection) asString.
		memberIndex filePool: repository filePool ]