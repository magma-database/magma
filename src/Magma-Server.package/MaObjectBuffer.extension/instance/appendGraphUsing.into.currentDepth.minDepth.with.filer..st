*magma-server
appendGraphUsing: aMaReadStrategy into: aMaSerializedGraphBuffer currentDepth: currentDepth minDepth: minDepth with: alreadyAppendedSet filer: aMaObjectFiler

	1
		to: self objectInstSize
		do:
			[ :varIndex | | oid |
			(MaOidCalculator isOidForOptimizedObject: (oid := self maInstVarAt: varIndex))
				ifFalse:
					[ | newMinDepth |
					currentDepth < (
						newMinDepth :=
							(aMaReadStrategy
								depthOfAttribute: varIndex
								onClassWithId: self classId
								version: self classVersion) + currentDepth
									max: minDepth)
										ifTrue:
											[ self
												appendGraphNode: oid
												into: aMaSerializedGraphBuffer
												using: aMaReadStrategy
												currentDepth: currentDepth
												minDepth: newMinDepth
												with: alreadyAppendedSet
												filer: aMaObjectFiler ] ] ]
