test concurrency
addObjectsForConcurrencyTest
	| oc mc |
	clientSession refresh.
	oc := clientSession root at: 'testConcurrency_oc'.
	mc := clientSession root at: 'testConcurrency_mc'.
	"Add the skipped element."
	clientSession commit: [ mc add: (oc at: 5) ]