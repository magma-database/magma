test rollback recovery
buildMagmaArray

	| ma |
	ma := MagmaArray new.
	1 to: 100 do: [ : e | ma at: e put: e printString ].
	clientSession commit:
		[ clientSession root
			at: 'existing-MagmaArray for commitDisaster'
			put: ma ]