test grow an object
ensureTooBigCommitFails
	"The oid-space cannot handle more than 4M new objects in a single commit.  If it allowed it, it could possibly overrun into the already-allocated user objects space.  Make sure that can't happen."

"Commented out because it takes too long to run.  Uncomment if you want to verify this test works."

"	self
		should:
			[ clientSession commit:
				[ clientSession root
					at: 'testGrowObject'
					put:
						((1 to: 5 million) collect:
							[ : n | Object new ]) ] ]
		raise: MagmaUserError.
	clientSession disconnect.
	self
		connect: clientSession location
		as: clientSession userId"