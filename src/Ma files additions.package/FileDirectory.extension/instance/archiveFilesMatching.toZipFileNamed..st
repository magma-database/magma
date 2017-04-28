*ma files additions
archiveFilesMatching: aBlock toZipFileNamed: zipFilename 
	| archive filesArchived |
	filesArchived := OrderedCollection new.
	archive := ZipArchive new.
	
	[ 'Archiving...' 
		displayProgressFrom: 0
		to: self entries size
		during: 
			[ : bar | 
			self entries withIndexDo: 
				[ : each : x | 
				bar value: x.
				(each isDirectory not and: [ aBlock value: each ]) ifTrue: 
					[ archive 
						addFile: each fullName
						as: each name.
					filesArchived add: each ] ] ].
	archive writeToFileNamed: (self fullNameFor: ((zipFilename 
				maEndsWith: '.zip'
				caseSensitive: false) 
				ifTrue: [ zipFilename ]
				ifFalse: [ zipFilename , '.zip' ])) ] ensure: [ archive close ].
	self halt.
	filesArchived do: [ : each | each delete ]