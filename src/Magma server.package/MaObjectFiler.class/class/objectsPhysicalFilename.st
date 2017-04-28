accessing
objectsPhysicalFilename
	"Since we're using MaTransactionalFileStreams, they also save multiple numbered files, so that unlimited repository sizes are possible."
	^ 'objects.1.dat'