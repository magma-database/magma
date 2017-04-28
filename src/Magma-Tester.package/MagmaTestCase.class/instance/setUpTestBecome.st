testBecome
setUpTestBecome
	clientSession commit:
		[ { localRoot.  clientSession root } do:
			[ : each |
			each at: #testBecomeToTransient put: { 'non becomed array' }.
			each at: #testBecomeToPersistent put: { 'becomer'.  'becomee with different size' } ] ]