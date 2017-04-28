removed
removed
	"Answer the dictionary of objects that have been removed in the local client, but not yet committed to the repository."
	^ changes
		at: #removed
		ifAbsentPut: [ MaIdentityDictionary new ]