actions
open: aFileDirectory 
	[ filer := MaObjectFiler open: aFileDirectory.
	filer validateVersion ] ifCurtailed:
		[ self close.
		^ self ].
	self postOpenInitialize