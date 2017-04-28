maui support
uiBackup
	MagmaNotification signal: 'User-interface backup.'.
	(Smalltalk hasClassNamed: #MauiWorld) ifTrue:
		[ | thisFamily persistentFamily |
		thisFamily := (Smalltalk classNamed: #MauiWorld) current family.
		persistentFamily := self definition uiFamily.
		thisFamily ~= persistentFamily ifTrue:
			[ self
				 timeoutSeconds: 600 ;
				 retrySeconds: 600 ;
				 commit:
					[ persistentFamily
						ifNil: [ self definition uiFamily: thisFamily ]
						ifNotNil: [ persistentFamily merge: thisFamily ] ] ;
				 timeoutSeconds: 30 ] ]