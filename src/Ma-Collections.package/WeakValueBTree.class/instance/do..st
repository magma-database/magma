enumerating
do: aBlock
	self keysAndValuesDo:
		[ : eachKey : eachValue |
		aBlock value:
			(Association
				key: eachKey
				value: eachValue) ]