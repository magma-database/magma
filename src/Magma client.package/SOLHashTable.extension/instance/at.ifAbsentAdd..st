*magma client
at: hashKey ifAbsentAdd: aBlock 
	"Add anObject at hashKey, if hashKey does not already exist."
	| hn |
	hn := self headNodeFor: hashKey.
	^ (frame
		at: (self regularKey: hashKey)
		ifAbsentPut: aBlock
		from: hn) ifNil:
		[ numElements := numElements + 1.
		self checkSize.
		self firstAt: hashKey ]