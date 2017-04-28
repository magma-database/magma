private
relevanceNames
	"Answer an Array of Strings that name the kinds of relevance matching as they relate to each search result, found by having applied a String in some way.  This is the default, subclasses may override as necessary, but if they do, they will also need to override matchFactorBetween:and: if they override the behavior, as well as the names of the various kinds of matching."

	^#('exact' 'case-insensitive' 'starts with' 'contains')  "sounds-like?"