test commit object knot
addKnot

	| root |
	root := clientSession root.
	clientSession commit:
		[ | knot |
		knot := root
			at: 'a knotty object'
			put: MaFixtureFactory new knot.
		root
			at: 'knotty object sizes'
			put: (knot collect: [ : e | e size ]) ].
	^nil