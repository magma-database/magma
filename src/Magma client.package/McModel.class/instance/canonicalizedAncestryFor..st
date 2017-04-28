private
canonicalizedAncestryFor: aMCVersion 
	^ aMCVersion info
		 canonicalizeAncestryUsing: self ;
		 yourself