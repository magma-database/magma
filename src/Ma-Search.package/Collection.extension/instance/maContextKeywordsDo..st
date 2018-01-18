*ma-search
maContextKeywordsDo: aBlock
	"Generally, a Collection won't be a single element of a larger container, but its certainly possible.  Nevertheless, we don't want to rely on my super implementation, (printString) which could easily truncate, causing inconsistent results."

	self do: [ : each | each maContextKeywordsDo: aBlock ]