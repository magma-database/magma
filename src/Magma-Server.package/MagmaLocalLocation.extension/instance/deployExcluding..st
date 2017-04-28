*magma-server-actions
deployExcluding: toExclude
	"I am the 'model' directory of some app dir in 'magma'.  Create a zip file of the app dir and its model, and all necessary scripts to start and manage the server under daemontools."
	| archive appDbDir appName | appDbDir := self directory containingDirectory.
	appName := appDbDir localName.
	self isMagmaRepository ifFalse: [ MagmaUserError signal: self asString , ' does not appear to be a Magma repository.' ].
	self isPotentiallyOpen ifTrue: [ MagmaUserError signal: 'Will not create a deployment archive on potentially-open DB.' ].
	"Remove public rw access from files in zip."
	ZipFileConstants classPool at: #DefaultFilePermissions put: 2r1000000110110000.
	archive := ZipArchive new.
	Cursor write showWhile:
		[ | archiveFilename appDbDirName |
		appDbDirName := 'work/magma/', appDbDir localName, '/'.
		MagmaServerConsole exportLinuxScripts.
		self writeSetPermsScript.  
		archive 
			addFile: 'setPerms' as: appDbDirName, 'setPerms' ;
			addFile: 'squeak.conf' as: appDbDirName, 'squeak.conf'.
		(appDbDir fileExists: 'port')
			ifTrue: [archive addFile: (appDbDir fullNameFor: 'port') as: 'port' ]
			ifFalse: [archive addString: (UIManager default request: 'What port # do you want for the port file?')  as: appDbDirName, 'port'].
		self addReadMeTo: archive as: appDbDirName, 'README'; addLogDaemonTo: archive as: appDbDirName, 'log/run'.
		"Zip linux scripts (w/ corresponding .st files), server image and changes, port file."
		MagmaServerConsole linuxScriptSelectors , MagmaServerConsole stScriptNames , #('server-spur.image' 'server-spur.changes') do:
			[ : each | (FileDirectory default fileExists: each asString)
				ifTrue:
					[ archive
						addFile: each asString
						as:
							appDbDirName,
								(appDbDir
									maNameFor: each asString
									relativeTo: appDbDir) ]
				ifFalse: [ MaSoftwareError signal ] ].
		"Zip the Spur VM"
		{'cogspurlinuxht'. Smalltalk sourcesName asDirectoryEntry name. 'SqueakSSL'} do:
			[ : each | archive
				addDirectoryTree: FileDirectory default / each
				relativeTo: FileDirectory default
				as: appDbDirName ].
		"Zip this model directory."
		archive
			addDirectoryTree: self directory
			relativeTo: appDbDir
			as: appDbDirName
			if: [ : entriesArray | entriesArray noneSatisfy: [ : eachEntry | toExclude includes: eachEntry name ] ].
		"Actually write the zip."
		archive writeToFileNamed: (archiveFilename := appName , '.zip') ]