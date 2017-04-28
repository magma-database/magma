testBecome
verifyBecome

	clientSession abort.
	self assert: (clientSession root at: #testBecomeToTransient) = { 'new'. 'becomed'. 'array' }.
	"remote becomes cannot be detected from transient objects."
	self assert: (localRoot at: #testBecomeToTransient) = { 'become to transient' }.

	self assert: (clientSession root at: #testBecomeToPersistent) = { 'becomee with different size'.  'becomee with different size' }