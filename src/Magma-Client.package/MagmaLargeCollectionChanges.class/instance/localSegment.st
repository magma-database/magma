reading
localSegment
	"Populate a segment from the uncommitted changes."
	| matching |
	matching := OrderedCollection new.
	self additionsDo: [ : object : hashes | matching add: object ].
	^ MagmaCollectionSegment new
		lastKnownSize: matching size ;
		objects: matching ;
		startIndex: 1 ;
		yourself