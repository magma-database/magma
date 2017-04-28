private
readerFor: anObject 
	^ self where:
		[ : rdr | | nextTerm attr |
		attr := equivalenceAttributes first.
		nextTerm := rdr
			read: attr
			at: (anObject perform: attr).
		(equivalenceAttributes copyWithout: equivalenceAttributes first) do:
			[ : each | nextTerm &
				(rdr
					read: each
					at: (anObject perform: each)) ] ]