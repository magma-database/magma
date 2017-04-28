as yet unclassified
example

	| stat |
	stat := self new.
	#(1 2 5 8 9 15) do: [ :each | stat addValue: each ].
	stat