maui support
uiRestore
	"If Maui is loaded and an application UI panels were backed up with #uiBackup, merge those panels into the current MauiWorld's Family."
	Smalltalk hasMaui
		ifTrue:
			[ self ensureConnected.
			self definition uiFamily ifNotNil:
				[ : family | (Smalltalk classNamed: #MauiWorld) current family merge: family ] ]
		ifFalse: [ MagmaUserError signal: 'Maui is not installed.' ]