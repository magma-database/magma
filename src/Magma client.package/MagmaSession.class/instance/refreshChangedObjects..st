private
refreshChangedObjects: changedObjects 
	"changedObjects is a Collection of MaObjectBuffers that were written by other clients.  For each one that the receiver still knows its oid, set all of its instVars to the objects that map by its referenced oids.  If a referenced oid is not in the client, substitute with a proxy."
	"Some Morphs cannot be refreshed while they're stepping in the world; therefore we provide this hack to ensure we only update them 'offline'; e.g., we delete, refresh, then add them back at the same position and index as they were.  The events restoreData is used to capture this temporary information."
	| refreshEvents |
	refreshEvents := OrderedCollection new.
	transaction suspendWriteBarrierModifiedsWhile: 
		[ changedObjects do: 
			[ : eachObjectBuffer | 
			| object |
			object := serializer 
				objectWithOid: eachObjectBuffer oid
				ifAbsent: [ nil ].
			(object == nil or: [ (object maIsMutatingProxy and: [ object maRealObjectIsReified not ]) or: [ object isImmutableInMagma ] ]) ifFalse: 
				[ | event |
				event := (MagmaRefreshEvent session: self)
					buffer: eachObjectBuffer ;
					object: object realObjectIfMutatingProxy ;
					yourself.
				self refreshObject: event.
				object realObjectIfMutatingProxy wantsMagmaEvents ifTrue: [ refreshEvents add: event ] ] ] ].
	refreshEvents do: 
		[ : each | 
		each object 
			triggerEvent: #magmaRefreshed
			with: each ]