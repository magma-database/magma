*ma base additions
maOn: exc1 do: block1 on: exc2 do: block2

	^[
		[ self value ]
			on: exc1
			do: block1 ]

		on: exc2
		do: block2