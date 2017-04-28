A MaCommitLogEntry is the entry used when my client is in a transaction.  I contain extra information about my clients commit.

Instance Variables
	commitPackage : A MaCommitPackage containing the objects of the commit.

	committed : A Dictionary of the individual MaObjectBuffers that were part of the commit, keyed by their oid.

	didCommitSpecialOid : A Boolean indicator of whether the class-definitions Dictionary object was part of the commit.

	magmaArrayCommits : Instances of MagmaArray that were committed.  They require special processing.
