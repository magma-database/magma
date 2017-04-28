private
setVersion
	| filer |
	MagmaNotification signal: 'Setting version to ', self newVersion.
	filer := MaObjectFiler open: self newVersionLocation directory.
	filer version: self legacyVersion + 1.
	filer close