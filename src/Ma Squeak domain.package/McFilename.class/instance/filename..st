initializing
filename: aString 
	| nameVersionExtension aix nameDashInitials fd |
	fd := FileDirectory default.
	nameVersionExtension := fd splitNameVersionExtensionFor: aString.
	extension := nameVersionExtension at: 3.
	versionNumber := nameVersionExtension at: 2.
	aix := nameVersionExtension first 
		lastIndexOf: $-
		ifAbsent: [ nil ].
	nameDashInitials := nameVersionExtension first.
	aix ifNotNil: 
		[ author := nameDashInitials 
			copyFrom: aix + 1
			to: nameDashInitials size.
		packageName := nameDashInitials 
			copyFrom: 1
			to: aix - 1 ]