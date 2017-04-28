accessing
add: newVal at: hashKey 
	"Add a newVal for hashKey."
	| hn |
	hn := self headNodeFor: hashKey.
	frame
		insert: newVal
		at: (self regularKey: hashKey)
		in: hn.
	numElements := numElements + 1.
	self checkSize.
	^ newVal