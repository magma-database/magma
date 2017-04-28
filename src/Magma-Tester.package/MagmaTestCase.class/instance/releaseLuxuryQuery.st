test query cancel
releaseLuxuryQuery
	"Assert still loading."
	| finalProgress |
	finalProgress := luxuryQueryReader fractionSorted.
	self
		 assert: finalProgress > 0 ;
		 assert: finalProgress < 1.
	luxuryQueryReader release.
	finalProgress := luxuryQueryReader fractionSorted.
	"Wait a few seconds, ensure it does not progress further."
	(Delay forSeconds: 5) wait.
	self assert: luxuryQueryReader fractionSorted = finalProgress