enumerating
keysDo: aBlock
	"Evaluate aBlock once for each of the receiver's regular keys, converting the keys back to the original hash keys."

	self regularNodesDo: [ :node | aBlock value: (self hashKey: node key)]