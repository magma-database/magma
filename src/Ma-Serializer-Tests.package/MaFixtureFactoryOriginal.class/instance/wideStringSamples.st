private non-collection samples
wideStringSamples
	^ Array with: (((12354 to: 12362) collect: [ : each | Unicode value: each ]) as: String)