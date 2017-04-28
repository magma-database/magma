*magma-server-actions
commitRestore
	| cont |
	[ cont := MagmaRepositoryController open: self.
	cont restoreMode ifTrue: [ cont commitRestore ] ] ensure:
		[ cont ifNotNil: [ cont close ] ]