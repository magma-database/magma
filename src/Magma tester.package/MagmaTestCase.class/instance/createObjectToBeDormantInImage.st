test refreshAll
createObjectToBeDormantInImage
	clientSession commit: 
		[ clientSession root 
			at: #testRefreshAll
			put: { 
					((1 to: 10) collect: [ : n | n asWords asLowercase ]).
					((11 to: 20) collect: [ : n | n asWords asLowercase ])
				 } ]