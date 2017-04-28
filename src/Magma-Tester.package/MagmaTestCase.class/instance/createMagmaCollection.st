test stale collections
createMagmaCollection

	| mc |
	mc := MagmaCollection new.
	MaTestCase withAllSubclasses do: [ : each | mc add: each ].
	clientSession commit:
		[ clientSession root
			at: 'testStaleCollections'
			put: mc ].
	localRoot
		at: 'testStaleCollections'
		put: mc