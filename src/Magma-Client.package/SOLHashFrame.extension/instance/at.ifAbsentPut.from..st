*magma-client
at: srchKey ifAbsentPut: aBlock from: aNode 
	"Return an old value that compares: equal to srchVal if one is present, otherwise return nil to indicate a successful insertion."
	(self
		locate: srchKey
		in: aNode) ifTrue: [ ^ curr value ].
	self insert:
		(SOLHashNode
			key: srchKey
			value: aBlock value).
	^ nil