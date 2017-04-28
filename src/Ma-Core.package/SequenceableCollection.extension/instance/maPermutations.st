*ma-core
maPermutations
	^ Array streamContents: 
		[ : stream | 
		self maPermutationsDo: [ : eachCombo | stream nextPut: eachCombo copy ] ]