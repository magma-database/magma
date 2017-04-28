*magma server
do: aBlock for: aMagmaFileTraverser using: aMaReadStrategy

	1 to: self size do:
		[ : x |  | oid |
		(oid := self at: x) ~= 0
			ifTrue:
				[ aMagmaFileTraverser
					graphFrom: oid
					do: aBlock
					using: aMaReadStrategy ] ]