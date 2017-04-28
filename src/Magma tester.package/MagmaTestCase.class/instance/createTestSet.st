test Set
createTestSet

	clientSession commit:
		[ clientSession root
			at: 'testSet'
			put: (Set with: (StringHolder new contents: 'proxied string'; yourself)) ]