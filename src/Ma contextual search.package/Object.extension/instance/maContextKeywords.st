*ma contextual search
maContextKeywords
	"Useful as an indexable attribute for Magma."
	^ Array streamContents: [ : stream | self maContextKeywordsDo: [ : each | stream nextPut: each ] ]