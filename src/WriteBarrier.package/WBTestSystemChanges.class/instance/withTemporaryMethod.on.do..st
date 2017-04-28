as yet unclassified
withTemporaryMethod: aString on: aClass do: aBlock
	aClass compile: aString classified: 'tests'.
	aBlock ensure: [aClass removeSelector: (Parser new parseSelector: aString)]