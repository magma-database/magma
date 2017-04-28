overriding
defaultLoadFactor
	"MagmaArray's excel at being large, and we should optimize for fast access.  This is better than 3 because it means that dummy elements only take up 8.3% more of the total space, and better than 1 because that would be one dummy for every real node, which is just too much space overhead.  2 seems to be the best balance."
	^ 2