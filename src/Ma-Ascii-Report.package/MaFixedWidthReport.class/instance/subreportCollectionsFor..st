private
subreportCollectionsFor: anObject 
	^ (subReports 
		at: anObject maOriginalClass
		ifAbsentPut: [ OrderedCollection new ]) collect: [ : each | each value: anObject ]