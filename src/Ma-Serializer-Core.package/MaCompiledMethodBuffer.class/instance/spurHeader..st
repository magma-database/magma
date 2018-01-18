access
spurHeader: aBoolean 
	"Specify whether the CompiledMethod this buffer should, when materialized, calculate its numLiterals using the new Spur way (1) or the old Cog way (0)."
	self controlFields2:
		(self controlFields2
			bitAt: 1
			put:
				(aBoolean
					ifTrue: [ 1 ]
					ifFalse: [ 0 ]))