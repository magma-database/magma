test rollback recovery
captureFileChecksumsWithCopy: aBoolean 
	| answer |
	magmaConsole shutdown.
	(aBoolean and: [ MagmaServerPreferences debugRecovery ]) ifTrue: [ self copyDb ].
	answer := self fileChecksums.
	magmaConsole open: self environmentDirectory.
	magmaConsole processOn: self class defaultServerPort.
	^ answer