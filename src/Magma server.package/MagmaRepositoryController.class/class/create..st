utilities
create: pathStringOrMagmaLocalLocation 
	"Creates a repository with an initial root of nil.  I #assureExistence of the location."
	| location |
	location := pathStringOrMagmaLocalLocation asMagmaLocalLocation.
	self validateCanCreateIn: location.
	self new createRepositoryAt: location.
	(self openedOn: location) in: 
		[ : rp | 
		
		[ rp fullBackupTo: location seedDirectory.
		[ rp isFullBackupRunning ] whileTrue: [ (Delay forSeconds: 1) wait ] ] ensure: [ rp close ] ]