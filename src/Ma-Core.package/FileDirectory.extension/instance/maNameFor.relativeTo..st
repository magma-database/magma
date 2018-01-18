*ma-core
maNameFor: filename relativeTo: containingDirectory 
	"Assume that I am contained somewhere in the tree of containingDirectory.  Answer the semi-qualified name for filename, qualified from containingDirectory down to this location."
	| fullName |
	fullName := self fullNameFor: filename.
	^ fullName = containingDirectory pathName
		ifTrue: [ String empty ]
		ifFalse:
			[ fullName
				copyFrom: containingDirectory pathName size + 2
				to: fullName size ]