private-samples
initializeSamples
	"Build a collection of four-element Array's."
	| firsts seconds thirds r|
	r := self random.
	samples := OrderedCollection new: 1000.
	firsts := (1 
		to: 10000
		by: 10) asArray shuffledBy: r.
	seconds := ((2453900 
		to: 2463899
		by: 10) collect: [ : e | Date julianDayNumber: e ]) shuffledBy: r.
	thirds := self keywordsSamples.
	1 
		to: firsts size
		do: 
			[ : n | 
			samples add: { 
					(firsts at: n).
					(seconds at: n).
					(thirds at: n)
				 } ]