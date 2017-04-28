enumerating
at: hashKey do: aBlock 
	"For each SOLHashNode with hashKey, value aBlock."
	| regKey |
	regKey := self regularKey: hashKey.
	self
		from: hashKey
		do: aBlock
		until:
			[ : eachSOLHashNode | eachSOLHashNode key > regKey ]