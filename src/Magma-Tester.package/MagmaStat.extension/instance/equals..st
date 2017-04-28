*magma-tester
equals: aMaStat 
	aMaStat maOriginalClass = self maOriginalClass.
	^ #(#sum #count #min #max #last ) allSatisfy:
		[ : each | (self perform: each) = (aMaStat perform: each) ]