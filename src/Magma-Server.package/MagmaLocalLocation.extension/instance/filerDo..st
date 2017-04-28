*magma-server-actions
filerDo: oneArgBlock 
	| filer |
	^ [ filer := MaObjectFiler open: self directory.
	oneArgBlock value: filer ] ensure:
		[ filer ifNotNil: [ filer close ] ]