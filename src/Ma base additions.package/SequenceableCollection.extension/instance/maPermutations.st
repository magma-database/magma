*ma base additions
maPermutations
	^ Array streamContents: 
		[ : stream | 
		self maPermutationsDo: [ : eachCombo | stream nextPut: eachCombo copy ] ]