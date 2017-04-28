I am responsible for recovery behaviors.

Commit-packages received into the server are prepared, serialized and flushed, wrapped in MaRecoveryRecord, to a commits file.  A separate process runs repeatedly, Delaying five seconds and then forking an atomic write of the extents.

The atomic write enumerates all of the MaTransactionalFileWriters and captures before-images of the portions of the files about to be overwritten, flushes them to the before-images file.  Then flushes all of the MaTransactionalFileWriters to their respective files.  Finally, an endApply record is flushed to the before-images file.

Reads can be interleaved with the atomic write but not commits because the atomic write does not represent a change in the state of the repository.

Recovery

If an outage occurs, we have, in the worst case:

	1) some data partially applied
	2) some data written to commitPackages, but not yet applied

Recovery addresses these in order.

Read the apply-file and look for an incomplete group, a set of RecoveryRecords that have no EndApplyRecord.  If this condition is discovered, the server was in the middle of an atomic-apply when failure occurred.  A partial apply occurred and we must write all of the before-images back to the various files.  Do that.

Now we know we do not have corrupt files, however we next need to apply all of the commitPackages that were written to the commit.log file but not yet applied.

We just apply the commitPackages whose commitNumber is greater than the commitNumber of the Filer.
