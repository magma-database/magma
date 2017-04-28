test grow an object
addAndGrowObject

	| c arr |
	c := Set new addAll: (101 to: 108); yourself.
	"Give it its own family, so we don't go trying to save the whole default family."
	arr := Array
		with: c
		with: nil
		with: self peopleSample1.
	clientSession begin.
	clientSession root at: 'testGrowObject' put: arr.
	clientSession commit.

	"grow the collection, forcing its buffer to be moved in the file.  Also tests commitAndBegin."
	clientSession begin.
	c addAll: (109 to: 259).
	clientSession commitAndBegin.

	(clientSession root at: 'testGrowObject') at: 2 put: '2'.
	clientSession commit