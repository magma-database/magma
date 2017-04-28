private
launchPlayerImages
	MagmaPreferences debug: true.
	"Make sure multiple files get tested by reducing it way down."
	MaAtomicFileStream maxPhysicalFileSize: 30000.
	"Make sure we test recovery requiring it to allocate extra space for recovery records."
	MaRecoveryManager defaultRecordSize: 25.	"way too small"
	super launchPlayerImages.
	self isConductorImage ifTrue: [ self new createRepository ]