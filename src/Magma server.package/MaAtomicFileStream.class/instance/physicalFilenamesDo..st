accessing
physicalFilenamesDo: oneArgBlock 
	"Value oneArgBlock with the names of my physical files."
	self directory in: 
		[ : dir | 
		dir entries do: 
			[ : each | 
			| eachParts |
			eachParts := dir splitNameVersionExtensionFor: each name.
			each name = (dir localNameFor: (self nameFor: eachParts second)) ifTrue: 
				[ "version"
				oneArgBlock value: each name ] ] ]