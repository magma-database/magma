accessing
firstAt: hashKey 
	"Answer the first element at hashKey or nil, if no objects exist at that hashKey."
	self
		at: hashKey
		do: [ : each | ^ each value ].
	^ nil