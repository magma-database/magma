as yet unclassified
withDefaultMethod: aString on: aClass do: aBlock
	aClass compile: aString classified: 'tests'.
	aBlock ensure: [aClass compile: aString classified: 'tests']