*ma base additions
maOn: exc1 do: block1 on: exc2 do: block2 on: exc3 do: block3

	^[
		[ self value ]
			on: exc1
			do: block1 ]

		maOn: exc2
		do: block2

		on: exc3
		do: block3