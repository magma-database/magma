private
materializeObject: aByteArray 
	"aByteArray is a MaGraphBuffer retrieved from the server.  Construct its object graph, noting each node in my serializer, linking up with previously materialized nodes by oid as appropriate."
	"When not using WriteBarrier, postMats won't cause objects to be dirty, so let's not allow them to be when using WriteBarrier."
	^ transaction suspendWriteBarrierModifiedsWhile: 
		[ 
		[ serializer 
			materializeGraph: aByteArray
			do: 
				[ : eachObject : eachBuffer | 
				eachObject wantsMagmaEvents ifTrue: 
					[" | event |
					event := (MagmaMaterializationEvent session: self)
						object: eachObject ;
						buffer: eachBuffer ;
						yourself.
					self 
						triggerEvent: #materializedFromMagma
						with: event"	"calls noteMaterialized:" ].
				transaction 
					markRead: eachObject
					using: eachBuffer ]
		"Handle MagmaSessionRequest to handle domains that reference the session directly." ] 
			on: MagmaSessionRequest
			do: [ : req | req handleAndResumeUsing: self ] ]