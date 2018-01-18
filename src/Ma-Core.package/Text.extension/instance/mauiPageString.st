*ma-core
mauiPageString
	"Same as #string, but includes the printStrings of embedded objects."
	^ String streamContents:
		[ : stream | (1 to: self size) do:
			[ : n | | char | (char := self at: n) = (Character value: 1)
				ifTrue:
					[ (self runs at: n) do:
						[ : eachAttr | eachAttr anchoredMorph ifNotNil:
							[ : morph | morph isMauiMorph ifTrue: [ stream maPrint: morph labelString ] ] ] ]
				ifFalse: [ stream nextPut: char ] ] ]