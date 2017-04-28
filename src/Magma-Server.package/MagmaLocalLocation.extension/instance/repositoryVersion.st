*magma-server-accessing
repositoryVersion
	| filer |
	^ [ filer := MaObjectFiler open: self directory.
	filer version ] ensure:
		[ filer ifNotNil: [ filer close ] ]