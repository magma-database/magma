accessing
keywordsSelection
	"Answers the keywords selected in a readable String."
	^ String streamContents: 
		[ : stream | 
		keywords withIndexDo: 
			[ : eachAnded : orIndex | 
			eachAnded withIndexDo: 
				[ : eachWord : andIndex | 
				stream
					nextPutAll: eachWord ;
					cr ].
			orIndex = keywords size ifFalse: [ stream nextPutAll: 'or ' ] ] ]