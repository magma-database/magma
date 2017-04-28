private
trunk
	^ trunk ifNil: 
		[ trunk := MaQueryTrunk new.
		expression 
			addMinimumEnumerationsTo: trunk
			using: collectionManager.
		trunk ]