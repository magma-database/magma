versions
versionNamed: aString
	"Answer the MCVersion or MCConfiguration with name matching aString."
	^ objects
		at: aString asMCVersionName
		ifAbsent: [ nil ]