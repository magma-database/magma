private
newChildCollection
	^ sortBlock 
		ifNil: [ OrderedCollection new ]
		ifNotNil: [ SortedCollection sortBlock: sortBlock ]