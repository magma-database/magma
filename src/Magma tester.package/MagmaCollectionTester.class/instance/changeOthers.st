test MagmaArray
changeOthers

	| ma |
	ma := clientSession root at: 'testMagmaArray'.
	1 to: 49 do: [ : n | ma at: n put: ((ma at: n) asNumber raisedTo: 2) ].
	51 to: 100 do: [ : n | ma at: n put: ((ma at: n) asNumber raisedTo: 2) ].
	clientSession commit.  "should be no commit-conflict because client1 only changed index 50."
	clientSession begin "prepare for next test"