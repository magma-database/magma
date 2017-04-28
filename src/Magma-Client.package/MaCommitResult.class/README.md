A MaCommitResult is the object returned to my client after performing a successful commit.

Instance Variables

	changedObjectBuffers : The 'committed' Dictionary from my containing MaCommitLogEntry which is used to update the clients readSet with the latest version of his buffers.

	newObjectBuffers : Same as changedObjectBuffers, except the new objects that were attached to the repository via reachability.  Their oids were updated to permanent-oids in the #registerUsing: and #link steps of the commit process.

	permanentOids : The Dictionary map of the transient-oid to the permanent-oid, used to update my clients OidManager.
