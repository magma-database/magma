*ma-serializer-core
fileInMaSerializedObjectNamed: filename 
	"This is to be used from preamble/postscript code to file in zip members as Objects."
	| member |
	member := self memberNamed: filename.
	member ifNil: [ ^ self errorNoSuchMember: filename ].
"This needs some work..."
	self class fileInMaSerializedObjectFromStream: member contentStream reset.
	self installed: member