test local sessions
runTestAdvanceIntoNewClassDefinitions
	"Test whether #advanceUsing: can withstand new class-definitions."
	| dbName s1 s2 c |
	dbName := self localDbName.
	s1 := MagmaSession openLocal: dbName.
	s1 connectAs: 's1'.
	s2 := MagmaSession openLocal: dbName.
	s2 allowWriteBarrier: self class allowWriteBarrier.
	s2 connectAs: 's2'.
	c := s2 root.	"prevent gc"
	
	[ s1 commit: 
		[ s1 root 
			at: 'hello'
			put: Morph new ].
	s2 tryToRefreshTo: s1 commitNumber ] ensure: 
		[ s1 disconnect.
		s2 disconnect ]