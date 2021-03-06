test MagmaStat
assertTypes: aMagmaStat 
	self
		 assert:
		(#(#deltaSum #sum #max #min #last ) allSatisfy:
			[ : each | (aMagmaStat perform: each) isFloat ]) ;
		 assert: aMagmaStat count isInteger ;
		 deny: aMagmaStat count > SmallInteger legacyMaxVal ;
		 assert: aMagmaStat deltaCount isInteger ;
		 deny: aMagmaStat deltaCount isLarge