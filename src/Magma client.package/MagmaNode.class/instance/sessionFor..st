accessing
sessionFor: aMagmaRemoteLocation 
	"In dealing with the servers of a node, it is necessary to lazily-initialize and cache MagmaSessions on account of how expensive they are to create."
	^ self sessions 
		at: aMagmaRemoteLocation
		ifAbsentPut: 
			[ | answer |
			answer := aMagmaRemoteLocation newAdminSession.
			answer user: (MagmaUser id: (String streamContents: 
						[ : stream | 
						stream maPrint: 'Admin-Session to '.
						aMagmaRemoteLocation maPrintAbbreviatedOn: stream ])).
			answer ]