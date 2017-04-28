private
playerProtocol
	^ super playerProtocol , ({ 
			#UUID.	"for #testMisbehavingSession."
			#ReadWriteStream.	"for fileouts"
			#LargePositiveInteger.	"for returning an oid"
			#MagmaRemoteLocation.
			#MaServerLocation.
			#MagmaPerson.
			#MaTestPersonName.
			#MaTestMailingAddress
		 } 
			select: [ : each | Smalltalk hasClassNamed: each ]
			thenCollect: [ : each | Smalltalk classNamed: each ]) , (self class withAllSubclasses asSortedCollection: [ : a : b | a name < b name ])