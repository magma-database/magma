copying
postArchivalCopy
	"#copy answers an 'archival copy, so we shutdown the active'."
	self archiveActive.
	history := history copy.
	timer := guard := nil