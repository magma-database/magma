accessing
pickColors
	"Pick and assign discerning colors for my lines and lenses."
	| colors |
	colors := self color luminance > 0.5
		ifTrue: [ self darkColors ]
		ifFalse: [ self lightColors ].
	series withIndexDo:
		[ : eachSeries : x | eachSeries color: (colors at: x) ]