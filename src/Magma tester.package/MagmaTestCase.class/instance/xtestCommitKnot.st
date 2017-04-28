test commit object knot
xtestCommitKnot
	"This method tests Magma's ability to commit a tangled knot of an
	object structure by one client, then retrieved and compared, as
	best as possible, against a dynamically created version of the
	same knot in client2 (see MaObjectGraphComparer for this)."

	self remotePerform: #addKnot in: 'client1'.
	self remotePerform: #verifyKnot in: 'client2'