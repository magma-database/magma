testBecome
become

	clientSession commit:
		[ | array |
		(clientSession root at: #testBecomeToTransient) become: { 'new'. 'becomed'. 'array' }.
		array := (clientSession root at: #testBecomeToPersistent).
		array first become: array last ]