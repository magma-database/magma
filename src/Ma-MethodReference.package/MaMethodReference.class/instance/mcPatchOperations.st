monticello
mcPatchOperations
	"Answer a collection of MCPatchOperations that can be displayed in a MCPatchBrowser which will reflect the history of this objects definition in relation to each other (not simply compared to the image version)."
	^(self mcHistory reversed
			inject: OrderedCollection new
			into:
				[ : coll : each | coll
					ifEmpty:
						[ coll
							 add: (MCAddition of: each) ;
							 yourself ]
					ifNotEmpty:
						[ coll
							 add:
							(MCModification
								of:
									(coll last isAddition
										ifTrue: [ coll last definition ]
										ifFalse: [ coll last modification ])
								to: each) ;
							 yourself ] ]) reversed