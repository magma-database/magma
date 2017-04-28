versions
versionNamesForPackageNamed: aString 
	^ (self versionsForPackageNamed: aString) collect:
		[ : each | each versionName ]