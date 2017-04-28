access
at: keyObject do: oneArgBlock 
	table
		at: (index indexHashForIndexObject: keyObject)
		do:
			[ : eachSolHashNode | | obj |
			obj := eachSolHashNode value.
			(obj realObjectIfMutatingProxy perform: index attribute) = keyObject ifTrue: [ oneArgBlock value: obj ] ]