access
at: keyObject do: oneArgBlock 
	table
		at: (index indexHashForIndexObject: keyObject)
		do: oneArgBlock