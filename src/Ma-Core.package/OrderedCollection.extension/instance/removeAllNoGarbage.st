*ma-core
removeAllNoGarbage
	1 to: array size do: [ : n | array at: n put: nil ].
	self reset