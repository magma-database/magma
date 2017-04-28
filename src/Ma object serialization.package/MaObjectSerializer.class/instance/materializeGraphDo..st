private
materializeGraphDo: twoArgBlock 
	"Materialize as much as the object in the receivers byteArray as possible.  For each object *materialized*, value twoArgBlock [ : eachObject : eachBuffer | ].  twoArgBlock is not valued for objects encountered in the materialized graph if they were already present in the receivers oidManager, that way we know when objects are exactly materialized."
	| skeletons rootObject |
	skeletons := OrderedCollection new: 48.
	rootObject := nil.
	self beBusy.
	
	[ self graphBuffer buffersDo: 
		[ : each | 
		| object |
		object := self 
			objectWithOid: each oid
			ifFound: 
				[ : foundObj | 
				(foundObj maIsMutatingProxy and: [ foundObj maRealObjectIsReified not ]) ifTrue: 
					[ skeletons add: (Association 
							key: (self 
									newSkeletonFor: each
									fromProxy: foundObj)
							value: each copyWithSameBuffer) ].
				foundObj realObjectIfMutatingProxy ]
			ifAbsent: 
				[ | newObject |
				skeletons add: (Association 
						key: (newObject := self 
								newSkeletonFor: each
								fromProxy: nil)
						value: each copyWithSameBuffer).
				newObject ].
		rootObject ifNil: [ rootObject := object ] ] ] 
		ensure: 
			[ | hashedCollections |
			hashedCollections := OrderedCollection new.
			skeletons do: 
				[ : eachAssociation | 
				| eachObject eachBuffer |
				eachObject := eachAssociation key.
				eachBuffer := eachAssociation value.
				eachObject maIsHashedCollection 
					ifTrue: [ hashedCollections add: eachAssociation ]
					ifFalse: 
						[ eachBuffer 
							establishReferencesFrom: eachObject
							using: self ] ].
			hashedCollections do: 
				[ : eachAssociation | 
				| eachObject eachBuffer |
				eachObject := eachAssociation key.
				eachBuffer := eachAssociation value.
				eachBuffer 
					establishReferencesFrom: eachObject
					using: self ].
			hashedCollections do: [ : eachAssociation | eachAssociation key rehash ] ].
	skeletons do: 
		[ : eachAssociation | 
		| eachFullyFormedObject eachBuffer |
		eachFullyFormedObject := eachAssociation key.
		eachBuffer := eachAssociation value.
		eachFullyFormedObject maWantsPostMaterialization ifTrue: [ self postMaterialize: eachFullyFormedObject ].
		twoArgBlock 
			value: eachFullyFormedObject
			value: eachBuffer ].
	self beBored.
	^ rootObject