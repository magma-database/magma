private
playerProtocol
	^ super playerProtocol ,
		(({#Bag. 
		#Association. 
		#UUID. 
		#ReadWriteStream. 
		#LargePositiveInteger. 
		#MagmaRemoteLocation. 
		#MaServerLocation. 
		#MagmaPerson. 
		#MaTestMailingAddress}
			select:
				[ : each | Smalltalk hasClassNamed: each ]
			thenCollect:
				[ : each | Smalltalk classNamed: each ]) ,
			(self class withAllSubclasses asSortedCollection:
				[ : a : b | a name < b name ]))