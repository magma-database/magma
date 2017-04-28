test query cancel
releaseLuxuryQuery
	"Assert still loading."
	| finalProgress |
	self assert: luxuryQueryReader fractionSorted > 0.
	self assert: luxuryQueryReader fractionSorted < 1.
	luxuryQueryReader release.
	finalProgress := luxuryQueryReader fractionSorted.
	"Wait a few seconds, ensure it does not progress further."
	(Delay forSeconds: 5) wait.
	self assert: luxuryQueryReader fractionSorted = finalProgress