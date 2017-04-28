factory
newSession
	| answer |
	answer := self sessionClass 
		host: self host
		port: self port.
	"Try to help the user in case they don't remember to turn this off on a localhost connection."
	self isLocalHost ifTrue: [ answer useCompression: false ].
	^ answer