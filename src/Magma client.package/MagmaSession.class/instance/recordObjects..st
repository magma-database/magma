private
recordObjects: aCollection 
	"aCollection of MaObjectBuffers."
	aCollection do:
		[ : each | serializer
			objectWithOid: each oid
			ifFound:
				[ : object | object maIsMutatingProxy
					ifTrue:
						[ object maRealObjectIsReified ifTrue:
							[ transaction
								markRead: object realObjectIfMutatingProxy
								using: each ] ]
					ifFalse:
						[ transaction
							markRead: object
							using: each ] ]
			ifAbsent: [ "do nothing"
				 ] ]