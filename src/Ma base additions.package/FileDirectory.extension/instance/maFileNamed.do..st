*ma base additions
maFileNamed: aString do: oneArgBlock 
	"A convenient accessing method for accessing a file without having to open and close yourself.  The oneArgBlock argument is the fileStream."
	| fileStream |
	fileStream := StandardFileStream fileNamed: (self fullNameFor: aString).
	fileStream ifNil: [ MaEnvironmentError signal: 'Could not open ' , aString , ' in use?' ].
	^ [ oneArgBlock value: fileStream ] ensure: [ fileStream close ]