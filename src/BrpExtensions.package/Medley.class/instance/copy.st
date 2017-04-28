copying
copy
	"Make a shallow copy of the collections"
	^ self clone
		 setCollections:
			(collections collect:
				[ : each | each isCollection
					ifTrue: [ each copy ]
					ifFalse: [ each ] ]) ;
		 yourself