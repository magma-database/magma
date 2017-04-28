private-samples
initializeNonPersistentSamples
	"Lets have 100 non-persistent samples interleaved with the persistent ones.."
	| firsts seconds thirds r |
	nonPersistentSamples := OrderedCollection new.
	firsts := (5 
		to: 1000
		by: 10) asArray shuffledBy: self random.
	seconds := ((2453905 
		to: 2454895
		by: 10) collect: [ : e | Date julianDayNumber: e ]) shuffledBy: self random.
	r := self random.
	thirds := (1 to: 100) collect: [ : n | (r nextInt: (1 bitShift: 128)) asWords subStrings ].
	1 to: firsts size do: 
		[ : n | 
		nonPersistentSamples add: {  (firsts at: n). (seconds at: n). (thirds at: n)  } ]