private
writeSubReportsOf: anObject to: aStream 
	| subReportCollections |
	self indent.
	(subReportCollections := self subreportCollectionsFor: anObject) do: 
		[ : eachCollection | 
		self 
			write: eachCollection
			to: aStream ].
	self outdent.
	subReportCollections notEmpty ifTrue: [ aStream cr ]