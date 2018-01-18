*ma-serializer-core
referencesDo: aBlock 
	"Traverse my contexts and their blocks and value aBlock their inst-vars."
	self
		maGraphWhere:
			[ : path : parent : index | | cl |
			cl := path last class.
			cl = self class or:
				[ cl = MethodContext or:
					[ parent class = MethodContext and: [ index >= 6 "only traverse the receiver and indexed inst-vars" ] ] ] ]
		do:
			[ : path : parent : index | path last == self ifFalse: [ aBlock value: path last ] ]